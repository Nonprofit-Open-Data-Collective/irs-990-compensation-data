---
title: "Tutorial Title"
date: `r format(Sys.time(), "%d %B, %Y")`
output:
  html_document:
    theme: readable
    df_print: paged
    highlight: tango
    smart: false
    toc: yes
    toc_float: no
editor_options: 
  chunk_output_type: console
---


```{r setup, include=FALSE}
knitr::opts_chunk$set( echo=TRUE, message=F, warning=F, fig.width=10 )
```


```{css, echo=F}
h1, h2{
  margin-top:100px;
  margin-bottom:20px;
}

table
{ 
    margin-left: auto;
    margin-right: auto;
    margin-top:80px;
    margin-bottom:800px;
}

img {
    max-width: 90%;
    display: block;
    margin-right: auto;
    margin-left: auto;
    margin-top:30px;
    margin-bottom:20px;
}
```
