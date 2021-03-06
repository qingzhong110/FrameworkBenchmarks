FROM hseeberger/scala-sbt:8u151-2.12.5-1.1.2
WORKDIR /finagle
COPY project project
COPY src src
COPY build.sbt build.sbt
RUN sbt assembly -batch
CMD ["java", "-server", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-XX:+AggressiveOpts", "-Dio.netty.recycler.maxCapacityPerThread=0", "-Dio.netty.leakDetection.level=disabled", "-jar", "target/scala-2.12/finagle-assembly-18.4.0.jar"]
