#Ryan Williams 1-5-13
#make sure you have these packages loaded
library(matR)
library(RJSONIO)
library(reshape)
library(vegan)
library(ggplot2)
library(RCurl)

#This is all Kevin Keegan's code for functions that he wrote#

source_https <- function(url, ...) {
# load package
require(RCurl)

# parse and evaluate each .R script
sapply(c(url, ...), function(u) {
eval(parse(text = getURL(u, followlocation = TRUE, cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))), envir = .GlobalEnv)
})
}

source_https("https://raw.github.com/DrOppenheimer/matR-apps/master/remove_singletons.r",
"https://raw.github.com/DrOppenheimer/matR-apps/master/collection-merge.R",
"https://raw.github.com/DrOppenheimer/matR-apps/master/norm_center_scale.r",
"https://raw.github.com/DrOppenheimer/matR-apps/master/plot_pcoa.from_object.r",
"https://raw.github.com/DrOppenheimer/matR-apps/master/heatmap_dendrogram.from_file.r")
#Now you can use Kevin's functions from the VM on your computer in R#


####do the first to using a new key generated from MG-RAST

mconfig$setAuth()

####check to see if you can get data in 

data<-c("Test"=4509406.3)
metagenome<-collection(data,  L1 = c (entry="count", level = "level1"), L2 = c (entry="count", level = "level2"))
str(metagenome)
#the str should be a bunch of uninterpretable information; that means it works!

#make a string of all the different MGRAST id numbers and whatever you would like to call them.  Below I have a string called data.2 that is all the 16S samples

#long lists can be made quickly in excel from the MG-RAST Table.xls that is on the Hofmockel_Kbase Google Drive.  By concatenating different cells together you can generate lists that can be pasted directly into R

#also below in data.metagenome is all the WGS sequences
data.2<-c(
"PF41-LM-October2012"="4506715.3",
"PF41-LM-July2012"="4506714.3",
"PF32-LM-October2012"="4506705.3",
"PF32-LM-July2012"="4506704.3",
"PF23-LM-October2012"="4506695.3",
"PF23-LM-July2012"="4506694.3",
"PF15-LM-October2012"="4506685.3",
"PF15-LM-July2012"="4506684.3",
"P46-LM-October2012"="4506675.3",
"P46-LM-July2012"="4506674.3",
"P31-LM-October2012"="4506665.3",
"P31-LM-July2012"="4506664.3",
"P24-LM-October2012"="4506655.3",
"P24-LM-July2012"="4506654.3",
"P13-LM-October2012"="4506645.3",
"P13-LM-July2012"="4506644.3",
"CC43-LM-October2012"="4506635.3",
"CC43-LM-July2012"="4506634.3",
"CC35-LM-October2012"="4506625.3",
"CC35-LM-July2012"="4506624.3",
"CC21-LM-October2012"="4506615.3",
"CC21-LM-July2012"="4506614.3",
"CC12-LM-October2012"="4506605.3",
"CC12-LM-July2012"="4506604.3",
"PF41-Micro-October2012"="4506717.3",
"PF41-Micro-July2012"="4506716.3",
"PF32-Micro-October2012"="4506707.3",
"PF32-Micro-July2012"="4506706.3",
"PF23-Micro-October2012"="4506697.3",
"PF23-Micro-July2012"="4506696.3",
"PF15-Micro-October2012"="4506687.3",
"PF15-Micro-July2012"="4506686.3",
"P46-Micro-October2012"="4506677.3",
"P46-Micro-July2012"="4506676.3",
"P31-Micro-October2012"="4506667.3",
"P31-Micro-July2012"="4506666.3",
"P24-Micro-October2012"="4506657.3",
"P24-Micro-July2012"="4506656.3",
"P13-Micro-October2012"="4506647.3",
"P13-Micro-July2012"="4506646.3",
"CC43-Micro-October2012"="4506637.3",
"CC43-Micro-July2012"="4506636.3",
"CC35-Micro-October2012"="4506627.3",
"CC35-Micro-July2012"="4506626.3",
"CC21-Micro-October2012"="4506617.3",
"CC21-Micro-July2012"="4506616.3",
"CC12-Micro-October2012"="4506607.3",
"CC12-Micro-July2012"="4506606.3",
"PF41-MM-October2012"="4506719.3",
"PF41-MM-July2012"="4506718.3",
"PF32-MM-October2012"="4506709.3",
"PF32-MM-July2012"="4506708.3",
"PF23-MM-October2012"="4506699.3",
"PF23-MM-July2012"="4506698.3",
"PF15-MM-October2012"="4506689.3",
"PF15-MM-July2012"="4506688.3",
"P46-MM-October2012"="4506679.3",
"P46-MM-July2012"="4506678.3",
"P31-MM-October2012"="4506669.3",
"P31-MM-July2012"="4506668.3",
"P24-MM-October2012"="4506659.3",
"P24-MM-July2012"="4506658.3",
"P13-MM-October2012"="4506649.3",
"P13-MM-July2012"="4506648.3",
"CC43-MM-October2012"="4506639.3",
"CC43-MM-July2012"="4506638.3",
"CC35-MM-October2012"="4506629.3",
"CC35-MM-July2012"="4506628.3",
"CC21-MM-October2012"="4506619.3",
"CC21-MM-July2012"="4506618.3",
"CC12-MM-October2012"="4506609.3",
"CC12-MM-July2012"="4506608.3",
"PF41-SM-October2012"="4506721.3",
"PF41-SM-July2012"="4506720.3",
"PF32-SM-October2012"="4506711.3",
"PF32-SM-July2012"="4506710.3",
"PF23-SM-October2012"="4506701.3",
"PF23-SM-July2012"="4506700.3",
"PF15-SM-October2012"="4506691.3",
"PF15-SM-July2012"="4506690.3",
"P46-SM-October2012"="4506681.3",
"P46-SM-July2012"="4506680.3",
"P31-SM-October2012"="4506671.3",
"P31-SM-July2012"="4506670.3",
"P24-SM-October2012"="4506661.3",
"P24-SM-July2012"="4506660.3",
"P13-SM-October2012"="4506651.3",
"P13-SM-July2012"="4506650.3",
"CC43-SM-October2012"="4506641.3",
"CC43-SM-July2012"="4506640.3",
"CC35-SM-October2012"="4506631.3",
"CC35-SM-July2012"="4506630.3",
"CC21-SM-October2012"="4506621.3",
"CC21-SM-July2012"="4506620.3",
"CC12-SM-October2012"="4506611.3",
"CC12-SM-July2012"="4506610.3",
"PF41-WS-October2012"="4506723.3",
"PF41-WS-July2012"="4506722.3",
"PF32-WS-October2012"="4506713.3",
"PF32-WS-July2012"="4506712.3",
"PF23-WS-October2012"="4506703.3",
"PF23-WS-July2012"="4506702.3",
"PF15-WS-October2012"="4506693.3",
"PF15-WS-July2012"="4506692.3",
"P46-WS-October2012"="4506683.3",
"P46-WS-July2012"="4506682.3",
"P31-WS-October2012"="4506673.3",
"P31-WS-July2012"="4506672.3",
"P24-WS-October2012"="4506663.3",
"P24-WS-July2012"="4506662.3",
"P13-WS-October2012"="4506653.3",
"P13-WS-July2012"="4506652.3",
"CC43-WS-October2012"="4506643.3",
"CC43-WS-July2012"="4506642.3",
"CC35-WS-October2012"="4506633.3",
"CC35-WS-July2012"="4506632.3",
"CC21-WS-October2012"="4506623.3",
"CC21-WS-July2012"="4506622.3",
"CC12-WS-October2012"="4506613.3",
"CC12-WS-July2012"="4506612.3"
) 

data.metagenome<-c("PF23-WS-July2012"="4509407.3",
"PF32-LM-July2012"="4509406.3",
"PF23-Micro-July2012"="4509405.3",
"PF41-SM-July2012"="4509404.3",
"PF15-WS-July2012"="4509403.3",
"PF15-LM-July2012"="4509402.3",
"PF32-Micro-July2012"="4509401.3",
"PF41-LM-July2012"="4509400.3",
"PF41-Micro-July2012"="4509399.3",
"PF15-Micro-July2012"="4509398.3",
"PF32-SM-July2012"="4509397.3",
"PF15-SM-July2012"="4509396.3")

#make your collection
community.2<-collection(data.2, count = c (entry = "count", annot = "organism", source = "m5rna", level = "phylum"))

# remove singletons
community.singletons_removed <- remove_singletons(as.matrix(community.2$count))

# normalize, standardize, and scale
community.singletons_removed.normed <-norm_center_scale(community.singletons_removed)

#now we will take the data and transpose it to make a dataframe where rows are samples and columns are species and abundances (species are the taxonomic level you chose in your collection)
d<-community.singletons_removed.normed
dt<-t(d)

#write this data file into a csv that you can manipulate in excel quickly and easily.  Substitute whatever filename you would like in for 'filename'.  It will save to your main directory for your computer.
write.csv(dt,"filename.csv")
#now you can take that csv and enter in all treatment data that you may need to discern aggregate size classes, sampling date, or to use metadata

#now you need to bring your data back into R; in this case the data was put into a dataframe called org.data.  The file.choose() function allows you to search your computer for the file you want.  It may be worth putting the full file path here instead.

org.data<-read.csv(file.choose())

#check dimensions and the head of the data frame to make sure it read in correctly
dim(org.data)
str(org.data)
head(org.data)

#the data should now be ready for any sort of statistical test that you may want to run as long as you are ok with the normalization that we have performed prior to this

#I will go forward with using an adonis (non-parametric manova) from the vegan package here

#look at the adonis help file (?adonis()) for help with this function.  I have the adonis being performed on all columns with species data in them (columns 5 through 47).  All other columns have treatment info (Treatment is the cropping system, SoilFrac is the aggregate size fraction, and Date is the sampling date).  The multiplication symbol between each thing shows that I am interested in both the main effect and the interaction.  If I want the interaction alone I would do something like this: Date:Treatment.  I have also set the permutations to 9999.  Less can be done if it is taking too long.

adonis(org.data[,c(5:47)]~Date*Treatment*SoilFrac,data=org.data,permutations=9999)

#Now I want to plot figures in ggplot2 but I want to reorganize it so that R can link each piece of metadata (MGRASTid, Treatment, and SoilFrac in this case) with a specific taxonomic level (i.e. the phylum Acidobacteria) and an abundance.  I do this using the melt function.

org.data.melt<-melt(org.data,id=c("MGRASTid","Treatment","SoilFrac","Date"))

#check it!
str(org.data.melt)

#melt makes a column of all the rows you melted down called 'variable' and all their values are placed under 'value'

#make new less confusing columns and remove the columns you don't need
org.data.melt$Phylum<-org.data.melt$variable
org.data.melt$Abundance<-org.data.melt$value
names(org.data.melt)
# org.data.norm has all the columns I need to make it more simple.  They also have more specific column headings now instead of variable and value
org.data.norm<-org.data.melt[,c(1:4,7,8)]

#check your new dataset
str(org.data.norm)
#here is an example of a plot that may be useful.  This will give horizontal boxplots for each phylum colored by the treatment (PF, P, CC)
ggplot(org.data.norm, aes(Phylum,Abundance))+geom_boxplot(aes(colour=Treatment))+coord_flip()+theme_bw()

#for individual ANOVAs you can use the the dataset imported from excel
str(org.data)
names(org.data)

#you can quickly see all the Phylum names to avoid misspelling with this function
list(unique(org.data.norm$Phylum))
#below will you give you the ANOVA
summary(test<-aov(Actinobacteria~Treatment, data=org.data))
TukeyHSD(test)

#here is a plot that will make it easier to interpret TukeyHSD() output
ggplot(org.data, aes(Treatment,Actinobacteria))+geom_boxplot()+theme_bw()+opts(aspect.ratio=1)

#Here is how you do a quick PCA for whatever data you are looking at.  There are several ways to plot this.  I will show you how to plot ellipses that are centered at the centroid of each group and their size is dependent on the standard deviation of each group.  Arrows are also included to show each individual species.

#first make a string out of the column that deliniates groups in your dataset.  For this example I am using a column that has information about aggregate size class.
SoilFrac<-org.data[,3]
#you also need to know all the different groups for your legend
list(unique(SoilFrac))
#make a string of all the different groups
legend.text<-c("WS","LM","MM","SM","Micro")

#I am making an object called ord that is the PCA for all species.  I have specified all the columns that contain species information in the dataset I am using within the function rda().  This is not an RDA.  You can quickly turn this into an RDA by including more information in the rda() function 
ord<-rda(org.data[,5:48])
#quick summary of the PCA
ord
#more in depth summary including eigenvectors and eigenvalues
summary(ord)
#make two objects: one has all species info and the other has all sample info (sites in this case is the same thing as samples)
species<-(scores(ord)$species)
sites<-(scores(ord)$sites)

#start with a blank plot
plot(ord, type="n")
#add arrows for species
arrows(0,0,(species[,1]),(species[,2]),col="red",length=.07)
#add text for the species names
text((species[,1]),(species[,2]),labels=Y,pos=2)
#now you will add the ellipses for each group.  the color can be changed in the col="" part of the ordiellipse function
ordiellipse(ord,SoilFrac,col="gray0",lwd=2,show.groups="WS")
ordiellipse(ord,SoilFrac,col="lightsalmon4",lwd=2,show.groups="LM")
ordiellipse(ord,SoilFrac,col="orangered3",lwd=2,show.groups="MM")
ordiellipse(ord,SoilFrac,col="orangered",lwd=2,show.groups="SM")
ordiellipse(ord,SoilFrac,col="red",lwd=2,show.groups="Micro")
#add a legend;  the first two numbers are the (x,y) coordinates that you would like the top left corner of the legend to begin.  Make sure that the colors in the col=c() correspond with the order in legend.text
legend(-.6,-.2,legend.text,text.col=c("gray0","lightsalmon4","orangered3","orangered","red"),cex=.75)
summary(ord)