import cv2
import xlrd
import xlsxwriter
import pandas as pd
from xlutils.copy import copy
from xlwt import Style

img=cv2.imread("m.png",0);


binary, contours, hierarchy = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

file="D:/M/robot/PythonApplication1/PythonApplication1/co.xls"

f = xlsxwriter.Workbook('cx.xlsx')
worksheet1 = f.add_worksheet('num')



#print(contours[0][2][0][1])
col=0
for i in range(len(contours)):
    for j in range(len(contours[i])):
        x=contours[i][j][0][0]
        y=contours[i][j][0][1]
        strx='%d' %x
        stry='%d' %y
        worksheet1.write(col, j, x)
        worksheet1.write(col+1, j, y)

    col=col+2
f.close()
cv2.waitKey(0)

