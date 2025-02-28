buildscript {
    val kotlinVersion = "1.9.23"  // Kotlin versiyasini to'g'ri ko'rsatish
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.3.1")  // To'g'ri sintaksis
        classpath("com.google.gms:google-services:4.4.1")    // To'g'ri sintaksis
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")  // To'g'ri sintaksis
    }
}


allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
