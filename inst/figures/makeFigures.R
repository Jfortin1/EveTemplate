library(EveTemplate)
eve_t1 <- readEve()
png("eve_t1.png")
orthographic(eve_t1)
dev.off()

seg <- readEveSeg()
png("eve_seg.png")
orthographic(seg)
dev.off()

map <- readEveMap(type="I")
png("eve_map1.png")
orthographic(map,col=c("black",rainbow(100)), bg="black")
dev.off()


