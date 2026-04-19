package org.androidaudioplugin.ports.juce.vaporizer2

import android.content.Context
import androidx.startup.Initializer
import java.io.File
import java.io.FileOutputStream

class VaporizerSetupInitializer : Initializer<Any?> {

    private fun xcopyFromAssetsToLocalStorage(context: Context, dst: File, src: String) {
        val list = context.assets.list(src) ?: return
        if (list.any()) {
            if (!dst.exists()) dst.mkdirs()
            for (sub in list)
                xcopyFromAssetsToLocalStorage(context, File(dst, sub), "$src/$sub")
        } else {
            FileOutputStream(dst).use { w ->
                context.assets.open(src).use { r -> r.copyTo(w) }
            }
        }
    }

    override fun create(context: Context): Any {
        val dataDir = context.dataDir
        if (!File(dataDir, "Presets").exists())
            for (sub in listOf("Noises", "Presets", "Tables"))
                xcopyFromAssetsToLocalStorage(context, File(dataDir, sub), "Vaporizer2/$sub")
        return ""
    }

    override fun dependencies(): MutableList<Class<out Initializer<*>>> = mutableListOf()
}
