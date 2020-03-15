select * from prescription
 
SELECT DISTINCT P.Patient_ID, VD.Physicians_Employee_ID
From Patient P
LEFT OUTER JOIN Visit_Details VD
ON P.Patient_ID = VD.Patient_Patient_ID










