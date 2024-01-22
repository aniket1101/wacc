ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.12"

lazy val root = (project in file("."))
  .settings(
    name := "WACC",
    idePackagePrefix := Some("wacc")
  )

libraryDependencies ++= Seq(
  "com.github.j-mie6" %% "parsley" % "5.0.0-M2",
  "org.scalatest" %% "scalatest" % "3.2.17" % Test
)