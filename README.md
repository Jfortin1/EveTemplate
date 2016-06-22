# EveTemplate
### JHU-MNI-ss (Eve) Template
--------

**Creator**: Jean-Philippe Fortin, jeanphi@mail.med.upenn.edu

**Authors**: Jean-Philippe Fortin, John Muschelli, Russell T. Shinohara

##### Software status

| Resource:      | Travis CI     |
| -------------  |  ------------- |
| Platform:      | OSX       |
| R CMD check    | <a href="https://travis-ci.org/Jfortin1/EveTemplate"><img src="https://travis-ci.org/Jfortin1/EveTemplate.svg?branch=master" alt="Build status"></a> |

##### Files

| File      | Description     | Reader | 
| -------------  | -------------  | -------------  |
| JHU_MNI_SS_TI.nii.gz    | T1-w Eve Template |  `readEveTemplate("T1")`| 
| JHU_MNI_SS_T2.nii.gz    | T2-w Eve Template |  `readEveTemplate("T2")`| 
| JHU_MNI_SS_Brain.nii.gz | T1-w Eve Template, skull stripped  |  `readEveTemplate("brain")`| 
| JHU_MNI_SS_Brain_Mask.nii.gz    | T1-w Eve Template, brain mask |  `readEveTemplate("brain_mask")`| 

