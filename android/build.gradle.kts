// Блок buildscript определяет зависимости для Gradle, такие как google-services
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Обновляем до последней версии google-services (из таблицы)
        classpath("com.google.gms:google-services:5.1.1")
    }
}

// Репозитории для всех подпроектов (нужны для загрузки зависимостей)
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Настройка кастомного пути для build-директории
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Настройка build-директории для каждого подпроекта
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Указываем, что подпроекты зависят от оценки модуля :app
subprojects {
    project.evaluationDependsOn(":app")
}

// Задача для очистки build-директории
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}