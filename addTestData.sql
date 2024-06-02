INSERT INTO `majors` (`id`, `name`, `active`) VALUES
(1, 'Computer Science, BS', 'Yes'),
(2, 'Data Science, BS, Computational Data Science Specialization', 'Yes'),
(3, 'Art Major, BA', 'Yes'),
(4, 'Physics, BS', 'Yes'),
(5, 'STEM Teaching Program, BA', 'Yes'),
(6, 'Mathematics: Middle Level Education, BA', 'Yes');

INSERT INTO `programs` (`id`, `major_id`, `year`, `credits`, `elective_credits`, `active`) VALUES
(1, 1, 2024, 87, 27, 'Yes'),
(2, 2, 2024, 102, 0, 'Yes'),
(3, 3, 2024, 74, 0, 'Yes'),
(4, 4, 2024, 110, 0, 'Yes'),
(5, 5, 2024, 49, 0, 'Yes'),
(6, 6, 2024, 100, 0, 'Yes');

INSERT INTO `users` (`id`, `login`, `password`, `name`, `program_id`, `superuser`, `last`, `first`) VALUES
(1, 'pedro', '$2b$12$xwhEBhdDAzq.J85iYef9au0VUYP0TS8VNvXYZOwTsmStUFCI1dSza', 'Pedro Teodoro', NULL, 'Yes', 'Teodoro', 'Pedro'),
(2, 'juddg', '$2y$10$V4ePfu5Ik.rs9GOpW2zbJuA2fsU0TP79O/ivTrGJmVG6AFUAXaUFC', 'Judd Grey', 1, 'No', 'Grey', 'Judd'),
(3, 'whitsette', '$2y$10$IY40k3WEhDiShgnlP7Z2gOkbFjNVNdzic9tK2Qca1KVY9H0bwvW4i ', 'Eva Whitsett', 1, 'No', 'Whitesett', 'Eva'),
(5, 'matt', '$2y$10$8XRqWgEtgcVwnQH6k12pEuzfY3bY6e.V3SgHm5cxq/hzaj.BLHdtC', 'Matt Ryan', 2, 'No', 'Ryan', 'Matt'),
(6, 'arty', '$2y$10$dS/3rCJ3zsq6ai2KAn.a4ut8ntR2co4UuyWK71A20dT8bBk8eohhC', 'Arty Paints', 3, 'No', 'Paints', 'Arty'),
(7, 'superuser', '$2y$10$zGAu11djtr5A5edgQMmJKe.UX8.tPnDYHb/9vqN3OJv5jGIi.axZO', 'Super User', NULL, 'Yes', 'User', 'Super'),
(8, 'dovhaletsd', '$2y$10$gTsfEez2jRAVJbLwccojt.0FvRMYCxvVra9cP0Y.VxToTnlf5sjZa', 'Dmytro Dovhalets', NULL, 'Yes', 'Dovhalets', 'Dmytro'),
(9, 'stonec', '$2y$10$IcieLNxsldG717.LWxSaBuKpxsR4ffPZoJyktngDpkQ8sJwngX9ri', 'Chris Stone', 1, 'No', 'Stone', 'Chris'),
(10, 'blackc', '$2y$10$d74wleYcfuuzHMP1FT2MeeLRob8E9ixUz8FBgUG0lhD1HjWPCGDo2', 'Chris Black', NULL, 'No', 'Black', 'Chris'),
(11, 'georger', '$2y$10$VVORQ/TVI.D5w6qIUWtbO.isywv6MxnIV4xydaa627couItbJ350i', 'Rachel George', NULL, 'No', 'George', 'Rachel'),
(12, 'eggera', '$2y$10$vKIa6E4lHW1vXAidjKvXKuUh7bgEKHhbRJ0wnHxODeXPxn4WMl3R.', 'Anne Egger', NULL, 'No', 'Egger', 'Anne'),
(13, 'palmquistb', '$2y$10$sDBDFWS0wABbuOcVbTeBcuJZFlG32YccsP5ZyvJBvwlTA1JJ6JOzm', 'Bruce Palmquist', NULL, 'No', 'Palmquist', 'Bruce'),
(14, 'hancocke', '$2y$10$FehGKDIcAbfLZknNNqUFVOzCSDN7HjcF4FAIEMF4q/4/SDazgdBJu', 'Emilie Hancock', NULL, 'No', 'Hancock', 'Emilie'),
(15, 'klyved', '$2y$10$yiWdDdiDxr.URnb6954XD.2WsCvx.LpGqDjngWQAFU.wAHMprBV02', 'Dominic Klyve', NULL, 'No', 'Klyve', 'Dominic'),
(16, 'klostermanp', '$2y$10$aqWuKxi6tTOswZ06Y13/j.pY.etAPVlkOVewS7dyGMobOlfzsCbjO', 'Peter Klosterman', NULL, 'No', 'Klosterman', 'Peter'),
(17, 'boersmas', '$2y$10$g9jGCokvo4X0jKirMv1HW.xm0XI//e.nwfCYXoV8DeRWA2aWkbasK', 'Stuart Boersma', NULL, 'No', 'Boersma', 'Stuart'),
(18, 'peasem', '$2y$10$WTe/LXAsCM.kEMpmY5o9LOIjvev4K96HmAmkR62Ii6H.sWk7Q4T96', 'Mike Pease', NULL, 'No', 'Pease', 'Mike'),
(19, 'montgomerya', '$2y$10$SXajG6a5Vo0Vwi.pIAeDDeOP3xMH6leke1yxszGHq1ah3chFTCCYu', 'Aaron Montgomery', NULL, 'No', 'Montgomery', 'Aaron'),
(20, 'lokes', '$2y$10$wFtDaEk2CcAEe4ZdWa9LleKiM/VQ5aACLa2uZOOlZfUDphQyZuqA6', 'Sooie-Hoe Loke', NULL, 'No', 'Loke', 'Sooie-Hoe'),
(21, 'mcconnellm', '$2y$10$4ADkOW0J7HfQuFJxI5JaNOTnGvOSkDam3rntI7hDhMaESrDh11hbi', 'Megan McConnell', NULL, 'No', 'McConnll', 'Megan');

INSERT INTO `classes` (`id`, `name`, `title`, `credits`, `fall`, `winter`, `spring`, `summer`, `active`) VALUES
(1, 'CS 110', 'Programming Fundamentals I', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(2, 'CS 111', 'Programming Fundamentals II', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(3, 'CS 112', 'Introduction to Data Science in Python', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(4, 'CS 301', 'Data Structures', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(5, 'CS 302', 'Advanced Data Structures and File Processing', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(6, 'CS 311', 'Computer Architecture I', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(7, 'CS 312', 'Computer Architecture II', 4, 'Yes', 'Yes', 'No', 'No', 'Yes'),
(8, 'CS 325', 'Technical Writing in Computer Science', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(9, 'CS 361', 'Principles of Language Design I', 4, 'Yes', 'No', 'No', 'No', 'Yes'),
(10, 'CS 362', 'Principles of Language Design II', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(11, 'CS 380', 'Introduction to Software Engineering', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(12, 'CS 392', 'Practical Experience in Debugging Computer Code', 1, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(13, 'CS 420', 'Database Management Systems', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(14, 'CS 427', 'Algorithm Analysis', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(15, 'CS 450', 'Computer Network and Data Communications', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(16, 'CS 470', 'Operating Systems', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(17, 'CS 480', 'Advanced Software Engineering', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(18, 'CS 481', 'Capstone Project', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(19, 'CS 489', 'Senior Colloquium', 1, 'Yes', 'No', 'Yes', 'No', 'Yes'),
(20, 'CS 492', 'Laboratory Experience in Teaching Computer Science', 2, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(21, 'MATH 172', 'Calculus I', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(22, 'MATH 260', 'Sets and Logic', 5, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(23, 'MATH 330', 'Discrete Mathematics', 5, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(24, 'MATH 173', 'Calculus II', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(25, 'MATH 265', 'Linear Algebra I', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(26, 'MATH 314', 'Probability and Statistics', 5, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(27, 'MATH 410A', 'Advanced Statistical Methods I', 4, 'Yes', 'Yes', 'No', 'No', 'Yes'),
(28, 'PHIL 318', 'Ethics for Big Data and Technology', 5, 'Yes', 'No', 'Yes', 'No', 'Yes'),
(29, 'CS 445', 'Data and Information Visualization', 4, 'No', 'No', 'Yes', 'No', 'Yes'),
(30, 'CS 456', 'Data Mining', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(31, 'CS 457', 'Computational Intelligence and Machine Learning', 4, 'No', 'Yes', 'No', 'No', 'Yes'),
(32, 'CS 465', 'Scientific Computing', 4, 'Yes', 'No', 'No', 'No', 'Yes'),
(33, 'CS 467', 'Computational Statistics', 4, 'Yes', 'Yes', 'No', 'No', 'Yes'),
(34, 'CS 351', 'Web Development Technologies II', 4, 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(35, 'MATH 130', 'Finite Mathematics', '5', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'), 
(36, 'MATH 154', 'Pre-Calculus Mathematics II', '5', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'), 
(37, 'MATH 164', 'Foundations of Arithmetic', '5', 'Yes', 'Yes', 'Yes', 'No', 'Yes'), 
(38, 'MATH 170', 'Intuitive Calculus', '5', 'No', 'Yes', 'No', 'No', 'Yes'), 
(39, 'MATH 211', 'Statistical Concepts and Methods', '5', 'Yes', 'Yes', 'Yes', 'No', 'Yes'), 
(40, 'MATH 226', 'Mathematics for Teachers: Geometry and Measurement', '4', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
(41, 'MATH 306', 'Middle-Level Mathematics Capstone', '3', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(42, 'MATH 316', 'Mathematics for Teachers: Proportional Reasoning and Algebra', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(43, 'MATH 332', 'Discrete Models', '4', 'Yes', 'No', 'No', 'No', 'Yes'),
(44, 'MATH 405', 'Discrete Models', '4', 'Yes', 'No', 'No', 'No', 'Yes'),
(45, 'MATH 406', 'Algebra for Teachers', '4', 'No', 'Yes', 'No', 'No', 'Yes'),
(46, 'MATH 456', 'Geometry for Teachers', '4', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(47, 'STP 201', 'Inquiry Approaches to Teaching', '2', 'Yes', 'Yes', 'No', 'No', 'Yes'),
(48, 'STP 202', 'Inquiry Based Lesson Design', '2', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(49, 'STP 300', 'Inquiry Approaches to Teaching and Lesson Design', '4', 'Yes', 'No', 'No', 'No', 'Yes'),
(50, 'STP 303', 'Knowing and Learning', '4', 'Yes', 'Yes', 'No', 'No', 'Yes'),
(51, 'STP 304', 'Classroom Interactions 1', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(52, 'STP 405', 'Classroom Interactions 2', '4', 'Yes', 'Yes', 'No', 'No', 'Yes'),
(53, 'STP 406', 'Project-Based Instruction', '3', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(54, 'STP 307A', 'Functions and Modeling for STEM Teaching', '3', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(55, 'STP 307B', 'Functions and Modeling for Secondary Mathematics', '3', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(56, 'STP 307C', 'Computer Science for STEM Teaching', '3', 'No', 'Yes', 'No', 'No', 'Yes'),
(57, 'STP 308', 'Perspectives on Science, Mathematics and STEM Education', '3', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(58, 'STP 309', 'Research Methods', '3', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(59, 'STP 450', 'Planning Inquiry Based STEM Education', '2', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(60, 'STP 465', 'Instructing and Assessing Inquiry Based STEM Education', '2', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(61, 'EFC 480', 'Student Teaching', '16', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(62, 'CHEM 181', 'General Chemistry I', '4', 'Yes', 'Yes', 'No', 'No', 'Yes'),
(63, 'CHEM 181LAB', 'General Chemistry Laboratory I', '1', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(64, 'CHEM 182', 'General Chemistry II', '4', 'No', 'Yes', 'Yes', 'Yes', 'Yes'),
(65, 'CHEM 182LAB', 'General Chemistry Laboratory II', '1', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(66, 'MATH 272', 'Multivariable Calculus I', '5', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(67, 'MATH 273', 'Multivariable Calculus II', '5', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(68, 'MATH 376', 'Differential Equations I', '3', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(69, 'PHYS 289', 'How to Succeed as a Physics Major', '1', 'No', 'Yes', 'No', 'No', 'Yes'),
(70, 'PHYS 317', 'Modern Physics I', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(71, 'PHYS 342', 'Thermodynamics', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(72, 'PHYS 351', 'Analytical Mechanics I', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(73, 'PHYS 361', 'Computational Physics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(74, 'PHYS 363', 'Optics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(75, 'PHYS 381', 'Electromagnetic Theory I', '4', 'Yes', 'No', 'No', 'No', 'Yes'),
(76, 'PHYS 489', 'Senior Assessment', '1', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(77, 'PHYS 495', 'Undergraduate Research', '1', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(78, 'PHYS 181', 'General Physics I with Laboratory', '5', 'Yes', 'Yes', 'No', 'No', 'Yes'),
(79, 'PHYS 182', 'General Physics II with Laboratory', '5', 'No', 'Yes', 'Yes', 'No', 'Yes'),
(80, 'PHYS 183', 'General Physics III with Laboratory', '5', 'No', 'No', 'Yes', 'No', 'Yes'),
(81, 'PHYS 318', 'Modern Physics II', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(82, 'PHYS 331', 'Laboratory Practices and Techniques', '3', 'No', 'No', 'Yes', 'No', 'Yes'),
(83, 'PHYS 333', 'Experimental Physics I', '3', 'Yes', 'No', 'No', 'No', 'Yes'),
(84, 'PHYS 382', 'Electromagnetic Theory II', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(85, 'PHYS 383', 'Electromagnetic Theory III', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(86, 'PHYS 451', 'Analytical Mechanics II', '3', 'Yes', 'No', 'No', 'No', 'Yes'),
(87, 'PHYS 474', 'Quantum Mechanics I', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(88, 'PHYS 301', 'Stellar Astrophysics', '4', 'No', 'Yes', 'No', 'No', 'Yes'),
(89, 'PHYS 303', 'Observational Astronomy', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(90, 'PHYS 304', 'Astrobiology: Origins and Search for Life in the Univers', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(91, 'PHYS 306', 'Gateway to Space', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(93, 'PHYS 320', 'Electrical Circuits I', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(94, 'PHYS 321', 'Electrical Circuits I Laboratory', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(95, 'PHYS 322', 'Molecular Biophysics', '4', 'No', 'Yes', 'No', 'No', 'Yes'),
(96, 'PHYS 323', 'Experimental Biophysics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(97, 'PHYS 334', 'Experimental Physics II', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(98, 'PHYS 392', 'Exploring Physics Teaching II', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(99, 'PHYS 396', 'Individual Study', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(100, 'PHYS 397', 'Honors', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(101, 'PHYS 398', 'Special Topics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(102, 'PHYS 399', 'Introduction to Medical Physics', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(103, 'PHYS 410', 'Mathematical Methods for the Physical Sciences and Engineering', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(104, 'PHYS 433', 'Experimental Atomic, Molecular, and Optical Physics', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(105, 'PHYS 441', 'Solid State Physics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(106, 'PHYS 454', 'Acoustics', '4', 'No', 'No', 'Yes', 'No', 'Yes'),
(107, 'PHYS 461', 'Advanced Computational Physics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(108, 'PHYS 475', 'Quantum Mechanics II', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(109, 'PHYS 490', 'Cooperative Education', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(110, 'PHYS 491', 'Workshop', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(111, 'PHYS 492', 'Laboratory Experience in Teaching Physics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(112, 'PHYS 496', 'Individual Study', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(113, 'PHYS 497', 'Honors', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(114, 'PHYS 498', 'Special Topics', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes'),
(115, 'PHYS 499', 'Seminar', '4', 'Yes', 'Yes', 'Yes', 'No', 'Yes');



INSERT INTO `program_classes` (`id`, `program_id`, `class_id`, `minimum_grade`, `sequence_no`, `template_qtr`, `template_year`, `required`) VALUES
(1, 1, 1, 20, 1, NULL, NULL, 'Yes'),
(2, 1, 2, 20, 1, NULL, NULL, 'Yes'),
(3, 1, 3, 20, 1, NULL, NULL, 'Yes'),
(4, 1, 4, 20, 1, NULL, NULL, 'Yes'),
(5, 1, 5, 20, 1, NULL, NULL, 'Yes'),
(6, 1, 6, 20, 1, NULL, NULL, 'Yes'),
(7, 1, 7, 20, 1, NULL, NULL, 'Yes'),
(8, 1, 8, 20, 1, NULL, NULL, 'Yes'),
(9, 1, 9, 20, 1, NULL, NULL, 'Yes'),
(10, 1, 10, 20, 1, NULL, NULL, 'Yes'),
(11, 1, 11, 20, 1, NULL, NULL, 'Yes'),
(12, 1, 12, 20, 1, NULL, NULL, 'Yes'),
(13, 1, 13, 20, 1, NULL, NULL, 'Yes'),
(14, 1, 14, 20, 1, NULL, NULL, 'Yes'),
(15, 1, 15, 20, 1, NULL, NULL, 'Yes'),
(16, 1, 16, 20, 1, NULL, NULL, 'Yes'),
(17, 1, 17, 20, 1, NULL, NULL, 'Yes'),
(18, 1, 18, 20, 1, NULL, NULL, 'Yes'),
(19, 1, 19, 20, 1, NULL, NULL, 'Yes'),
(20, 1, 20, 20, 1, NULL, NULL, 'Yes'),
(21, 1, 21, 20, 1, NULL, NULL, 'Yes'),
(22, 1, 22, 20, 1, NULL, NULL, 'Yes'),
(23, 1, 23, 20, 1, NULL, NULL, 'Yes'),
(24, 1, 24, 20, 1, NULL, NULL, 'No'),
(25, 1, 25, 20, 1, NULL, NULL, 'No'),
(26, 1, 28, 20, 1, NULL, NULL, 'No'),
(27, 1, 29, 20, 1, NULL, NULL, 'No'),
(28, 1, 30, 20, 1, NULL, NULL, 'No'),
(29, 1, 31, 20, 1, NULL, NULL, 'No'),
(30, 1, 32, 20, 1, NULL, NULL, 'No'),
(31, 1, 33, 20, 1, NULL, NULL, 'No'),
(32, 1, 34, 20, 1, NULL, NULL, 'No'),
(33, 2, 1, 20, 1, NULL, NULL, 'Yes'),
(34, 2, 2, 20, 1, NULL, NULL, 'Yes'),
(35, 2, 3, 20, 1, NULL, NULL, 'Yes'),
(36, 2, 4, 20, 1, NULL, NULL, 'Yes'),
(37, 2, 5, 20, 1, NULL, NULL, 'Yes'),
(38, 2, 8, 20, 1, NULL, NULL, 'Yes'),
(39, 2, 9, 20, 1, NULL, NULL, 'Yes'),
(40, 2, 11, 20, 1, NULL, NULL, 'Yes'),
(41, 2, 13, 20, 1, NULL, NULL, 'Yes'),
(42, 2, 17, 20, 1, NULL, NULL, 'Yes'),
(43, 2, 18, 20, 1, NULL, NULL, 'Yes'),
(44, 2, 21, 20, 1, NULL, NULL, 'Yes'),
(45, 2, 22, 20, 1, NULL, NULL, 'Yes'),
(46, 2, 23, 20, 1, NULL, NULL, 'Yes'),
(47, 2, 24, 20, 1, NULL, NULL, 'Yes'),
(48, 2, 25, 20, 1, NULL, NULL, 'Yes'),
(49, 2, 26, 20, 1, NULL, NULL, 'Yes'),
(50, 2, 27, 20, 1, NULL, NULL, 'Yes'),
(51, 2, 28, 20, 1, NULL, NULL, 'Yes'),
(52, 2, 29, 20, 1, NULL, NULL, 'Yes'),
(53, 2, 30, 20, 1, NULL, NULL, 'Yes'),
(54, 2, 31, 20, 1, NULL, NULL, 'Yes'),
(55, 2, 32, 20, 1, NULL, NULL, 'Yes'),
(56, 2, 33, 20, 1, NULL, NULL, 'Yes'),
(57, 4, 62, 20, 1, NULL, NULL, 'Yes'),
(58, 4, 63, 20, 1, NULL, NULL, 'Yes'),
(59, 4, 64, 20, 1, NULL, NULL, 'Yes'),
(60, 4, 65, 20, 1, NULL, NULL, 'Yes'),
(61, 4, 21, 20, 1, NULL, NULL, 'Yes'),
(62, 4, 24, 20, 1, NULL, NULL, 'Yes'),
(63, 4, 25, 20, 1, NULL, NULL, 'Yes'),
(64, 4, 66, 20, 1, NULL, NULL, 'Yes'),
(65, 4, 67, 20, 1, NULL, NULL, 'Yes'),
(66, 4, 68, 20, 1, NULL, NULL, 'Yes'),
(67, 4, 69, 20, 1, NULL, NULL, 'Yes'),
(68, 4, 70, 20, 1, NULL, NULL, 'Yes'),
(69, 4, 71, 20, 1, NULL, NULL, 'Yes'),
(70, 4, 72, 20, 1, NULL, NULL, 'Yes'),
(71, 4, 73, 20, 1, NULL, NULL, 'Yes'),
(72, 4, 74, 20, 1, NULL, NULL, 'Yes'),
(73, 4, 75, 20, 1, NULL, NULL, 'Yes'),
(74, 4, 76, 20, 1, NULL, NULL, 'Yes'),
(75, 4, 77, 20, 1, NULL, NULL, 'Yes'),
(76, 4, 78, 20, 1, NULL, NULL, 'Yes'),
(77, 4, 79, 20, 1, NULL, NULL, 'Yes'),
(78, 4, 80, 20, 1, NULL, NULL, 'Yes'),
(79, 4, 81, 20, 1, NULL, NULL, 'Yes'),
(80, 4, 82, 20, 1, NULL, NULL, 'Yes'),
(81, 4, 83, 20, 1, NULL, NULL, 'Yes'),
(82, 4, 84, 20, 1, NULL, NULL, 'Yes'),
(83, 4, 85, 20, 1, NULL, NULL, 'Yes'),
(84, 4, 86, 20, 1, NULL, NULL, 'Yes'),
(85, 4, 87, 20, 1, NULL, NULL, 'Yes'),
(86, 4, 88, 20, 1, NULL, NULL, 'No'),
(87, 4, 89, 20, 1, NULL, NULL, 'No'),
(88, 4, 90, 20, 1, NULL, NULL, 'No'),
(89, 4, 91, 20, 1, NULL, NULL, 'No'),
(90, 4, 93, 20, 1, NULL, NULL, 'No'),
(91, 4, 94, 20, 1, NULL, NULL, 'No'),
(92, 4, 95, 20, 1, NULL, NULL, 'No'),
(93, 4, 96, 20, 1, NULL, NULL, 'No'),
(94, 4, 97, 20, 1, NULL, NULL, 'No'),
(95, 4, 98, 20, 1, NULL, NULL, 'No'),
(96, 4, 99, 20, 1, NULL, NULL, 'No'),
(97, 4, 100, 20, 1, NULL, NULL, 'No'),
(98, 4, 101, 20, 1, NULL, NULL, 'No'),
(99, 4, 102, 20, 1, NULL, NULL, 'No'),
(100, 4, 103, 20, 1, NULL, NULL, 'No'),
(101, 4, 104, 20, 1, NULL, NULL, 'No'),
(102, 4, 105, 20, 1, NULL, NULL, 'No'),
(103, 4, 106, 20, 1, NULL, NULL, 'No'),
(104, 4, 107, 20, 1, NULL, NULL, 'No'),
(105, 4, 108, 20, 1, NULL, NULL, 'No'),
(106, 4, 109, 20, 1, NULL, NULL, 'No'),
(107, 4, 110, 20, 1, NULL, NULL, 'No'),
(108, 4, 111, 20, 1, NULL, NULL, 'No'),
(109, 4, 112, 20, 1, NULL, NULL, 'No'),
(110, 4, 113, 20, 1, NULL, NULL, 'No'),
(111, 4, 114, 20, 1, NULL, NULL, 'No'),
(112, 4, 115, 20, 1, NULL, NULL, 'No'),
(113, 5, 47, 20, 1, NULL, NULL, 'Yes'),
(114, 5, 48, 20, 1, NULL, NULL, 'Yes'),
(115, 5, 49, 20, 1, NULL, NULL, 'Yes'),
(116, 5, 50, 20, 1, NULL, NULL, 'Yes'),
(117, 5, 51, 20, 1, NULL, NULL, 'Yes'),
(118, 5, 52, 20, 1, NULL, NULL, 'Yes'),
(119, 5, 53, 20, 1, NULL, NULL, 'Yes'),
(120, 5, 54, 20, 1, NULL, NULL, 'Yes'),
(121, 5, 55, 20, 1, NULL, NULL, 'Yes'),
(122, 5, 56, 20, 1, NULL, NULL, 'Yes'),
(123, 5, 57, 20, 1, NULL, NULL, 'Yes'),
(124, 5, 58, 20, 1, NULL, NULL, 'Yes'),
(125, 5, 59, 20, 1, NULL, NULL, 'Yes'),
(126, 5, 60, 20, 1, NULL, NULL, 'Yes'),
(127, 5, 61, 20, 1, NULL, NULL, 'Yes'),
(128, 6, 47, 20, 1, NULL, NULL, 'No'),
(129, 6, 48, 20, 1, NULL, NULL, 'No'),
(130, 6, 49, 20, 1, NULL, NULL, 'No'),
(131, 6, 50, 20, 1, NULL, NULL, 'No'),
(132, 6, 51, 20, 1, NULL, NULL, 'No'),
(133, 6, 52, 20, 1, NULL, NULL, 'No'),
(134, 6, 53, 20, 1, NULL, NULL, 'No'),
(135, 6, 54, 20, 1, NULL, NULL, 'No'),
(136, 6, 55, 20, 1, NULL, NULL, 'No'),
(137, 6, 56, 20, 1, NULL, NULL, 'No'),
(138, 6, 57, 20, 1, NULL, NULL, 'No'),
(139, 6, 58, 20, 1, NULL, NULL, 'No'),
(140, 6, 59, 20, 1, NULL, NULL, 'No'),
(141, 6, 60, 20, 1, NULL, NULL, 'No'),
(142, 6, 61, 20, 1, NULL, NULL, 'No'),
(143, 6, 35, 20, 1, NULL, NULL, 'Yes'),
(144, 6, 36, 20, 1, NULL, NULL, 'Yes'),
(145, 6, 37, 20, 1, NULL, NULL, 'Yes'),
(146, 6, 38, 20, 1, NULL, NULL, 'Yes'),
(147, 6, 39, 20, 1, NULL, NULL, 'Yes'),
(148, 6, 40, 20, 1, NULL, NULL, 'Yes'),
(149, 6, 41, 20, 1, NULL, NULL, 'Yes'),
(150, 6, 42, 20, 1, NULL, NULL, 'Yes'),
(151, 6, 43, 20, 1, NULL, NULL, 'Yes'),
(152, 6, 44, 20, 1, NULL, NULL, 'Yes'),
(153, 6, 45, 20, 1, NULL, NULL, 'Yes'),
(154, 6, 46, 20, 1, NULL, NULL, 'Yes');

INSERT INTO `students` (`id`, `first`, `last`, `cwu_id`, `email`, `phone`, `address`, `postbaccalaureate`, `withdrawing`, `veterans_benefits`, `active`, `non_stem_majors`) VALUES
(1, 'John', 'Smith', 30937808, 'johnsmith', '5095555555', '400 E University Way, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(2, 'Amanda', 'Hunter', 25735736, 'huntera', '5091234567', '1731 1st St Ste 100, Yakima, WA 98901', 'Yes', 'No', 'No', 'Yes', NULL),
(3, 'Tracey', 'Larson', 36817571, 'larsont', '5092345678', '7230 Melissa Glens Apt. 478, Pullman, WA 99163', 'Yes', 'No', 'No', 'No', NULL),
(4, 'Marilyn', 'Cooper', 59866971, 'cooperm', '5093456789', '8452 Stephanie Shoals Apt. 836, Spokane, WA 99205', 'No', 'Yes', 'No', 'Yes', NULL),
(5, 'Lacey', 'Fuentes', 67357214, 'fuentesl', '5094567890', '1231 Harris Village, Wenatchee, WA 98801', 'No', 'Yes', 'No', 'Yes', NULL),
(6, 'Casey', 'Nelson', 32985207, 'nelsonc', '2061234567', '9695 Mcneil Avenue, Shoreline, WA 98133', 'Yes', 'No', 'Yes', 'Yes', NULL),
(7, 'Brandon', 'Evans', 49328797, 'evansb', '2062345678', '34891 Adam Mountains, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(8, 'Timothy', 'Silva', 57024325, 'silvat', '2063456789', '23 Pineda Rapids Suite 250, Mercer Island, WA 98040', 'No', 'No', 'No', 'No', NULL),
(9, 'Catherine', 'Williams', 65739828, 'williamsc', '2064567890', '602 Terri Knoll, Seattle, WA 98105', 'No', 'No', 'No', 'No', NULL),
(10, 'Matthew', 'Brown', 52436153, 'brownm', '3601234567', '694 Chavez Meadow, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(11, 'Donald', 'Smith', 60139611, 'smithd', '6191234567', '1160 Lane Knoll, La Mesa, CA 91942', 'No', 'No', 'No', 'Yes', 'Art Major, BA'),
(12, 'Sarah', 'Wright', 39926295, 'wrights', '2539304642', '175 James Vista Suite 452, Federal Way, WA 98003', 'No', 'No', 'No', 'Yes', NULL),
(13, 'Jacob', 'Jackson', 54020137, 'jacksonj', '4259418961', '977 Ellen Circles, Everett, WA 98201', 'Yes', 'No', 'No', 'Yes', NULL),
(14, 'Miranda', 'Bell', 72312534, 'bellm', '4259596692', '0343 Megan Ports, Issaquah, WA 98027', 'No', 'Yes', 'No', 'Yes', NULL),
(15, 'Pedro', 'Pascal', 23124342, 'pascalp', '5034536400', '8776 David Lane, Salem, OR 97301', 'No', 'No', 'Yes', 'Yes', NULL),
(16, 'Liam', 'Berry', 49328732, 'berryl', '5419498691', '499 Acevedo Flat, Eugene, OR 97401', 'No', 'No', 'Yes', 'Yes', NULL),
(17, 'Ed', 'Sheer', 57024123, 'sheere', '2538291823', '4881 Krueger Spur, Auburn, WA 98002', 'No', 'No', 'No', 'No', NULL),
(18, 'Eduardo', 'Villa', 65712348, 'villae', '2539871822', '125 Phyllis Parkways, Gig Harbor, WA 98335', 'No', 'No', 'No', 'No', NULL),
(19, 'Max', 'Deere', 52436253, 'deerem', '2539189120', '64113 Stevens Place Suite 442, Kent, WA 98032', 'Yes', 'No', 'No', 'Yes', 'Art Major, BA'),
(20, 'Mark', 'Henry', 60124111, 'henrym', '4257601234', '246 Thompson Fork, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', 'Art Major, BA'),
(21, 'John', 'Cena', 39926243, 'cenaj', '4251826030', '182 Grant Drive Suite 787, Issaquah, WA 98027', 'Yes', 'No', 'No', 'Yes', NULL),
(22, 'Brandy', 'Martinez', 54020423, 'martinezb', '4259303040', '59877 Osborn Knoll, Bothell, WA 98011', 'No', 'No', 'No', 'Yes', NULL),
(23, 'Jake', 'Robin', 60139612, 'robinj', '5034601234', '441 Jessica Light, Hillsboro, OR 97124', 'No', 'No', 'No', 'Yes', 'Art Major, BA'),
(24, 'Eve', 'Clancy', 39926435, 'clancye', '5039402112', '245 Keith Mission Apt. 027, Astoria, OR 97103', 'No', 'No', 'No', 'Yes', NULL),
(25, 'Hunter', 'Helmsy', 54025437, 'helmsyh', '5037801234', '1754 Tucker Springs Apt. 890, Salem, OR 97301', 'No', 'No', 'No', 'Yes', NULL),
(26, 'Israel', 'Sanchez', 67357215, 'sanchezi', '5415556460', '1274 Jonathan Mission, Bend, OR 97701', 'No', 'Yes', 'No', 'Yes', NULL),
(27, 'Cassie', 'Yeung', 32985203, 'yeungc', '5419801234', '619 Sheila Run, Eugene, OR 97401', 'No', 'No', 'Yes', 'Yes', NULL),
(28, 'Miguel', 'Fernandez', 49322317, 'fernandezm', '5413405190', '242 Brady Lakes, Bend, OR 97701', 'No', 'No', 'Yes', 'Yes', NULL),
(29, 'Miguel', 'Fernandez', 57021235, 'fernandezm2', '5091239876', '4621 Jeremy Flat Suite 867, Ellensburg, WA 98926', 'No', 'No', 'No', 'No', NULL),
(30, 'Cat', 'Mendez', 65734328, 'mendezc', '2067775555', '653 Long Views Apt. 335, Burien, WA 98148', 'Yes', 'No', 'No', 'No', NULL),
(31, 'Melissa', 'Campos', 734, 'camposm', '4259596632', '509 S 1st St Apt 2, Walla Walla, WA 99362', 'No', 'No', 'No', 'No', NULL),
(32, 'Emily', 'Nguyen', 81234567, 'nguyene', '2061234568', '1234 Elm St, Seattle, WA 98101', 'No', 'No', 'No', 'Yes', NULL),
(33, 'David', 'Lee', 82345678, 'leed', '5093334444', '5678 Oak Ave, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(34, 'Jessica', 'Garcia', 83456789, 'garciaj', '4251112222', '910 Pine Rd, Tacoma, WA 98401', 'Yes', 'No', 'No', 'Yes', NULL),
(35, 'Andrew', 'Chen', 84567890, 'chena', '3601115555', '1112 Cedar Blvd, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(36, 'Samantha', 'Tran', 85678901, 'trans', '5095556666', '1314 Maple Ln, Yakima, WA 98901', 'No', 'No', 'No', 'Yes', NULL),
(37, 'Daniel', 'Hernandez', 86789012, 'hernandezd', '2063337777', '1516 Walnut St, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(38, 'Olivia', 'Lopez', 87890123, 'lopezo', '4259990000', '1718 Spruce Ave, Everett, WA 98201', 'Yes', 'No', 'No', 'Yes', NULL),
(39, 'Ethan', 'Nguyen', 88901234, 'nguyene2', '5091112345', '1920 Birch Rd, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(40, 'Sophia', 'Tran', 89012345, 'trans2', '3602223456', '2122 Ash Ln, Vancouver, WA 98660', 'No', 'No', 'No', 'Yes', NULL),
(41, 'Ryan', 'Kim', 90123456, 'kimr', '2064445678', '2324 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(42, 'Avery', 'Johnson', 91234567, 'johnsona', '5096667890', '2526 Elm Ave, Wenatchee, WA 98801', 'Yes', 'No', 'No', 'Yes', NULL),
(43, 'Natalie', 'Davis', 92345678, 'davisn', '4257778901', '2728 Pine Rd, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', NULL),
(44, 'Joseph', 'Wilson', 93456789, 'wilsonj', '3609990123', '2930 Cedar Blvd, Mount Vernon, WA 98273', 'No', 'No', 'Yes', 'Yes', NULL),
(45, 'Madison', 'Anderson', 94567890, 'andersonm', '5091114567', '3132 Maple Ln, Moses Lake, WA 98837', 'No', 'No', 'No', 'Yes', NULL),
(46, 'Logan', 'Taylor', 95678901, 'taylorl', '2062228901', '3334 Walnut St, Redmond, WA 98052', 'Yes', 'No', 'No', 'Yes', NULL),
(47, 'Chloe', 'Moore', 96789012, 'moorec', '4253334567', '3536 Spruce Ave, Olympia, WA 98501', 'No', 'No', 'No', 'Yes', NULL),
(48, 'Aiden', 'Jackson', 97890123, 'jacksona', '5094445678', '3738 Birch Rd, Kennewick, WA 99336', 'No', 'No', 'Yes', 'Yes', NULL),
(49, 'Elizabeth', 'Martin', 98901234, 'martine', '3605550123', '3940 Ash Ln, Bellingham, WA 98225', 'Yes', 'No', 'No', 'Yes', NULL),
(50, 'William', 'Thompson', 99012345, 'thompsonw', '2066667890', '4142 Oak St, Kirkland, WA 98033', 'No', 'No', 'No', 'Yes', NULL),
(51, 'Grace', 'White', 10123456, 'whiteg', '5098881234', '4344 Elm Ave, Pullman, WA 99163', 'No', 'No', 'No', 'Yes', NULL),
(52, 'Liam', 'Patel', 10234567, 'patell', '2061234569', '4546 Pine Rd, Seattle, WA 98101', 'No', 'No', 'No', 'Yes', NULL),
(53, 'Emma', 'Kim', 10345678, 'kime', '5093334445', '4748 Cedar Blvd, Spokane, WA 99201', 'Yes', 'No', 'No', 'Yes', NULL),
(54, 'Noah', 'Singh', 10456789, 'singhn', '4251112223', '4950 Maple Ln, Tacoma, WA 98401', 'No', 'No', 'Yes', 'Yes', NULL),
(55, 'Olivia', 'Nguyen', 10567890, 'nguyeno', '3601115556', '5152 Walnut St, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(56, 'Ava', 'Chen', 10678901, 'chena2', '5095556667', '5354 Spruce Ave, Yakima, WA 98901', 'Yes', 'No', 'No', 'Yes', NULL),
(57, 'Elijah', 'Gupta', 10789012, 'guptae', '2063337778', '5556 Birch Rd, Bellevue, WA 98004', 'No', 'No', 'No', 'Yes', NULL),
(58, 'Sophia', 'Shah', 10890123, 'shahs', '4259990001', '5758 Ash Ln, Everett, WA 98201', 'No', 'No', 'Yes', 'Yes', NULL),
(59, 'William', 'Zhang', 10901234, 'zhangw', '5091112346', '5960 Oak St, Ellensburg, WA 98926', 'Yes', 'No', 'No', 'Yes', NULL),
(60, 'Isabella', 'Liu', 11012345, 'liui', '3602223457', '6162 Elm Ave, Vancouver, WA 98660', 'No', 'No', 'No', 'Yes', NULL),
(61, 'James', 'Ali', 11123456, 'alij', '2064445679', '6364 Pine Rd, Issaquah, WA 98027', 'No', 'No', 'No', 'Yes', NULL),
(62, 'Charlotte', 'Hassan', 11234567, 'hassanc', '5096667891', '6566 Cedar Blvd, Wenatchee, WA 98801', 'Yes', 'No', 'Yes', 'Yes', NULL),
(63, 'Benjamin', 'Khan', 11345678, 'khanb', '4257778902', '6768 Maple Ln, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', NULL),
(64, 'Amelia', 'Siddiqui', 11456789, 'siddiquia', '3609990124', '6970 Walnut St, Mount Vernon, WA 98273', 'No', 'No', 'No', 'Yes', NULL),
(65, 'Lucas', 'Patel', 11567890, 'patell2', '5091114568', '7172 Spruce Ave, Moses Lake, WA 98837', 'Yes', 'No', 'No', 'Yes', NULL),
(66, 'Mia', 'Kim', 11678901, 'kimm', '2062228902', '7374 Birch Rd, Redmond, WA 98052', 'No', 'No', 'Yes', 'Yes', NULL),
(67, 'Henry', 'Singh', 11789012, 'singhh', '4253334568', '7576 Ash Ln, Olympia, WA 98501', 'No', 'No', 'No', 'Yes', NULL),
(68, 'Evelyn', 'Nguyen', 11890123, 'nguyene3', '5094445679', '7778 Oak St, Kennewick, WA 99336', 'Yes', 'No', 'No', 'Yes', NULL),
(69, 'Alexander', 'Chen', 11901234, 'chena3', '3605550124', '7980 Elm Ave, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(70, 'Harper', 'Gupta', 12012345, 'guptah', '2066667891', '8182 Pine Rd, Kirkland, WA 98033', 'No', 'No', 'Yes', 'Yes', NULL),
(71, 'Daniel', 'Shah', 12123456, 'shahd', '5098881235', '8384 Cedar Blvd, Pullman, WA 99163', 'Yes', 'No', 'No', 'Yes', NULL),
(72, 'Abigail', 'Zhang', 12234567, 'zhanga', '2061234570', '8586 Maple Ln, Seattle, WA 98101', 'No', 'No', 'No', 'Yes', NULL),
(73, 'Matthew', 'Liu', 12345678, 'lium', '5093334446', '8788 Walnut St, Spokane, WA 99201', 'No', 'No', 'No', 'Yes', NULL),
(74, 'Emily', 'Ali', 12456789, 'alie', '4251112224', '8990 Spruce Ave, Tacoma, WA 98401', 'Yes', 'No', 'Yes', 'Yes', NULL),
(75, 'Michael', 'Hassan', 12567890, 'hassanm', '3601115557', '9192 Birch Rd, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(76, 'Elizabeth', 'Khan', 12678901, 'khane', '5095556668', '9394 Ash Ln, Yakima, WA 98901', 'No', 'No', 'No', 'Yes', NULL),
(77, 'Ethan', 'Siddiqui', 12789012, 'siddiquie', '2063337779', '9596 Oak St, Bellevue, WA 98004', 'Yes', 'No', 'No', 'Yes', NULL),
(78, 'Avery', 'Patel', 12890123, 'patela', '4259990002', '9798 Elm Ave, Everett, WA 98201', 'No', 'No', 'Yes', 'Yes', NULL),
(79, 'Sofia', 'Kim', 12901234, 'kims', '5091112347', '99100 Pine Rd, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(80, 'Jacob', 'Singh', 13012345, 'singhj', '3602223458', '100102 Cedar Blvd, Vancouver, WA 98660', 'Yes', 'No', 'No', 'Yes', NULL),
(81, 'Scarlett', 'Nguyen', 13123456, 'nguyens', '2064445680', '101104 Maple Ln, Issaquah, WA 98027', 'No', 'No', 'No', 'Yes', NULL),
(82, 'Joseph', 'Chen', 13234567, 'chenj', '5096667892', '102106 Walnut St, Wenatchee, WA 98801', 'No', 'No', 'Yes', 'Yes', NULL),
(83, 'Victoria', 'Gupta', 13345678, 'guptav', '4257778903', '103108 Spruce Ave, Lynnwood, WA 98036', 'Yes', 'No', 'No', 'Yes', NULL),
(84, 'David', 'Shah', 13456789, 'shahda', '3609990125', '104110 Birch Rd, Mount Vernon, WA 98273', 'No', 'No', 'No', 'Yes', NULL),
(85, 'Grace', 'Zhang', 13567890, 'zhangg', '5091114569', '105112 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'No', 'Yes', NULL),
(86, 'Levi', 'Liu', 13678901, 'liul', '2062228903', '106114 Oak St, Redmond, WA 98052', 'Yes', 'No', 'Yes', 'Yes', NULL),
(87, 'Natalie', 'Ali', 13789012, 'alin', '4253334569', '107116 Elm Ave, Olympia, WA 98501', 'No', 'No', 'No', 'Yes', NULL),
(88, 'Samuel', 'Hassan', 13890123, 'hassans', '5094445680', '108118 Pine Rd, Kennewick, WA 99336', 'No', 'No', 'No', 'Yes', NULL),
(89, 'Chloe', 'Khan', 13901234, 'khanc', '3605550125', '109120 Cedar Blvd, Bellingham, WA 98225', 'Yes', 'No', 'No', 'Yes', NULL),
(90, 'Aiden', 'Siddiqui', 14012345, 'siddiquia2', '2066667892', '110122 Maple Ln, Kirkland, WA 98033', 'No', 'No', 'Yes', 'Yes', NULL),
(91, 'Aria', 'Patel', 14123456, 'patela2', '5098881236', '111124 Walnut St, Pullman, WA 99163', 'No', 'No', 'No', 'Yes', NULL),
(92, 'Jackson', 'Kim', 14234567, 'kimj', '2061234571', '112126 Spruce Ave, Seattle, WA 98101', 'Yes', 'No', 'No', 'Yes', NULL),
(93, 'Ella', 'Singh', 14345678, 'singhe', '5093334447', '113128 Birch Rd, Spokane, WA 99201', 'No', 'No', 'No', 'Yes', NULL),
(94, 'Sebastian', 'Nguyen', 14456789, 'nguyens2', '4251112225', '114130 Ash Ln, Tacoma, WA 98401', 'No', 'No', 'Yes', 'Yes', NULL),
(95, 'Zoe', 'Chen', 14567890, 'chenz', '3601115558', '115132 Oak St, Bellingham, WA 98225', 'Yes', 'No', 'No', 'Yes', NULL),
(96, 'Carter', 'Gupta', 14678901, 'guptac', '5095556669', '116134 Elm Ave, Yakima, WA 98901', 'No', 'No', 'No', 'Yes', NULL),
(97, 'Penelope', 'Shah', 14789012, 'shahp', '2063337780', '117136 Pine Rd, Bellevue, WA 98004', 'No', 'No', 'No', 'Yes', NULL),
(98, 'Julian', 'Zhang', 14890123, 'zhangj', '4259990003', '118138 Cedar Blvd, Everett, WA 98201', 'Yes', 'No', 'Yes', 'Yes', NULL),
(99, 'Lily', 'Liu', 14901234, 'liul2', '5091112348', '119140 Maple Ln, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(100, 'Jack', 'Ali', 15012345, 'alij2', '3602223459', '120142 Walnut St, Vancouver, WA 98660', 'No', 'No', 'No', 'Yes', NULL),
(101, 'Lillian', 'Hassan', 15123456, 'hassanl', '2064445681', '121144 Spruce Ave, Issaquah, WA 98027', 'Yes', 'No', 'No', 'Yes', NULL),
(102, 'Ryan', 'Khan', 15234567, 'khanr', '5096667893', '122146 Birch Rd, Wenatchee, WA 98801', 'No', 'No', 'Yes', 'Yes', NULL),
(103, 'Nora', 'Siddiqui', 15345678, 'siddiquin', '4257778904', '123148 Ash Ln, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', NULL),
(104, 'Luke', 'Patel', 15456789, 'patell3', '3609990126', '124150 Oak St, Mount Vernon, WA 98273', 'Yes', 'No', 'No', 'Yes', NULL),
(105, 'Addison', 'Kim', 15567890, 'kima', '5091114570', '125152 Elm Ave, Moses Lake, WA 98837', 'No', 'No', 'No', 'Yes', NULL),
(106, 'Gabriel', 'Singh', 15678901, 'singhg', '2062228904', '126154 Pine Rd, Redmond, WA 98052', 'No', 'No', 'Yes', 'Yes', NULL),
(107, 'Hazel', 'Nguyen', 15789012, 'nguyenh', '4253334570', '127156 Cedar Blvd, Olympia, WA 98501', 'Yes', 'No', 'No', 'Yes', NULL),
(108, 'Caleb', 'Chen', 15890123, 'chenc', '5094445681', '128158 Maple Ln, Kennewick, WA 99336', 'No', 'No', 'No', 'Yes', NULL),
(109, 'Aubrey', 'Gupta', 15901234, 'guptaa', '3605550126', '129160 Walnut St, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(110, 'Owen', 'Shah', 16012345, 'shaho', '2066667893', '130162 Spruce Ave, Kirkland, WA 98033', 'Yes', 'No', 'Yes', 'Yes', NULL),
(111, 'Willow', 'Zhang', 16123456, 'zhangw2', '5098881237', '131164 Birch Rd, Pullman, WA 99163', 'No', 'No', 'No', 'Yes', NULL),
(112, 'Wyatt', 'Liu', 16234567, 'liuw', '2061234572', '132166 Ash Ln, Seattle, WA 98101', 'No', 'No', 'No', 'Yes', NULL),
(113, 'Hannah', 'Ali', 16345678, 'alih', '5093334448', '133168 Oak St, Spokane, WA 99201', 'Yes', 'No', 'No', 'Yes', NULL),
(114, 'Landon', 'Hassan', 16456789, 'hassanl2', '4251112226', '134170 Elm Ave, Tacoma, WA 98401', 'No', 'No', 'Yes', 'Yes', NULL),
(115, 'Everly', 'Khan', 16567890, 'khane2', '3601115559', '135172 Pine Rd, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(116, 'Liam', 'Siddiqui', 16678901, 'siddiquil', '5095556670', '136174 Cedar Blvd, Yakima, WA 98901', 'Yes', 'No', 'No', 'Yes', NULL),
(117, 'Mackenzie', 'Patel', 16789012, 'patelm', '2063337781', '137176 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'No', 'Yes', NULL),
(118, 'Elias', 'Kim', 16890123, 'kime2', '4259990004', '138178 Walnut St, Everett, WA 98201', 'No', 'No', 'Yes', 'Yes', NULL),
(119, 'Aubree', 'Singh', 16901234, 'singha', '5091112349', '139180 Spruce Ave, Ellensburg, WA 98926', 'Yes', 'No', 'No', 'Yes', NULL),
(120, 'Connor', 'Nguyen', 17012345, 'nguyenc', '3602223460', '140182 Birch Rd, Vancouver, WA 98660', 'No', 'No', 'No', 'Yes', NULL),
(121, 'Paisley', 'Chen', 17123456, 'chenp', '2064445682', '141184 Ash Ln, Issaquah, WA 98027', 'No', 'No', 'No', 'Yes', NULL),
(122, 'Ezra', 'Gupta', 17234567, 'guptae2', '5096667894', '142186 Oak St, Wenatchee, WA 98801', 'Yes', 'No', 'Yes', 'Yes', NULL),
(123, 'Emilia', 'Shah', 17345678, 'shahe', '4257778905', '143188 Elm Ave, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', NULL),
(124, 'Thomas', 'Zhang', 17456789, 'zhangt', '3609990127', '144190 Pine Rd, Mount Vernon, WA 98273', 'No', 'No', 'No', 'Yes', NULL),
(125, 'Hadley', 'Liu', 17567890, 'liuh', '5091114571', '145192 Cedar Blvd, Moses Lake, WA 98837', 'Yes', 'No', 'No', 'Yes', NULL),
(126, 'Finn', 'Ali', 17678901, 'alif', '2062228905', '146194 Maple Ln, Redmond, WA 98052', 'No', 'No', 'Yes', 'Yes', NULL),
(127, 'Layla', 'Hassan', 17789012, 'hassanl3', '4253334571', '147196 Walnut St, Olympia, WA 98501', 'No', 'No', 'No', 'Yes', NULL),
(128, 'Aiden', 'Khan', 17890123, 'khana', '5094445682', '148198 Spruce Ave, Kennewick, WA 99336', 'Yes', 'No', 'No', 'Yes', NULL),
(129, 'Adalyn', 'Siddiqui', 17901234, 'siddiquia3', '3605550127', '149200 Birch Rd, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(130, 'Grayson', 'Patel', 18012345, 'patelg', '2066667894', '150202 Ash Ln, Kirkland, WA 98033', 'No', 'No', 'Yes', 'Yes', NULL),
(131, 'Amaya', 'Kim', 18123456, 'kima2', '5098881238', '151204 Oak St, Pullman, WA 99163', 'Yes', 'No', 'No', 'Yes', NULL),
(132, 'Oliver', 'Singh', 18234567, 'singho', '2061234573', '152206 Elm Ave, Seattle, WA 98101', 'No', 'No', 'No', 'Yes', NULL),
(133, 'Mila', 'Nguyen', 18345678, 'nguyenm', '5093334449', '153208 Pine Rd, Spokane, WA 99201', 'No', 'No', 'No', 'Yes', NULL),
(134, 'Elijah', 'Chen', 18456789, 'chene', '4251112227', '154210 Cedar Blvd, Tacoma, WA 98401', 'Yes', 'No', 'Yes', 'Yes', NULL),
(135, 'Ivy', 'Gupta', 18567890, 'guptai', '3601115560', '155212 Maple Ln, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(136, 'Jayden', 'Shah', 18678901, 'shahj', '5095556671', '156214 Walnut St, Yakima, WA 98901', 'No', 'No', 'No', 'Yes', NULL),
(137, 'Harper', 'Zhang', 18789012, 'zhangh', '2063337782', '157216 Spruce Ave, Bellevue, WA 98004', 'Yes', 'No', 'No', 'Yes', NULL),
(138, 'Mason', 'Liu', 18890123, 'lium2', '4259990005', '158218 Birch Rd, Everett, WA 98201', 'No', 'No', 'Yes', 'Yes', NULL),
(139, 'Ella', 'Ali', 18901234, 'alie2', '5091112350', '159220 Ash Ln, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(140, 'Aria', 'Hassan', 19012345, 'hassana', '3602223461', '160222 Oak St, Vancouver, WA 98660', 'Yes', 'No', 'No', 'Yes', NULL),
(141, 'Logan', 'Khan', 19123456, 'khanl', '2064445683', '161224 Elm Ave, Issaquah, WA 98027', 'No', 'No', 'No', 'Yes', NULL),
(142, 'Everly', 'Siddiqui', 19234567, 'siddiquie2', '5096667895', '162226 Pine Rd, Wenatchee, WA 98801', 'No', 'No', 'Yes', 'Yes', NULL),
(143, 'Henry', 'Patel', 19345678, 'patelh', '4257778906', '163228 Cedar Blvd, Lynnwood, WA 98036', 'Yes', 'No', 'No', 'Yes', NULL),
(144, 'Violet', 'Kim', 19456789, 'kimv', '3609990128', '164230 Maple Ln, Mount Vernon, WA 98273', 'No', 'No', 'No', 'Yes', NULL),
(145, 'William', 'Singh', 19567890, 'singhw', '5091114572', '165232 Walnut St, Moses Lake, WA 98837', 'No', 'No', 'No', 'Yes', NULL),
(146, 'Nova', 'Nguyen', 19678901, 'nguyenn', '2062228906', '166234 Spruce Ave, Redmond, WA 98052', 'Yes', 'No', 'Yes', 'Yes', NULL),
(147, 'Jack', 'Chen', 19789012, 'chenj2', '4253334572', '167236 Birch Rd, Olympia, WA 98501', 'No', 'No', 'No', 'Yes', NULL),
(148, 'Aurora', 'Gupta', 19890123, 'guptaa2', '5094445683', '168238 Ash Ln, Kennewick, WA 99336', 'No', 'No', 'No', 'Yes', NULL),
(149, 'James', 'Shah', 19901234, 'shahj2', '3605550128', '169240 Oak St, Bellingham, WA 98225', 'Yes', 'No', 'No', 'Yes', NULL),
(150, 'Scarlett', 'Zhang', 20012345, 'zhangs', '2066667895', '170242 Elm Ave, Kirkland, WA 98033', 'No', 'No', 'Yes', 'Yes', NULL),
(151, 'Theodore', 'Liu', 20123456, 'liut', '5098881239', '171244 Pine Rd, Pullman, WA 99163', 'No', 'No', 'No', 'Yes', NULL),
(152, 'Hazel', 'Ali', 20234567, 'alih2', '2061234574', '172246 Cedar Blvd, Seattle, WA 98101', 'Yes', 'No', 'No', 'Yes', NULL),
(153, 'Owen', 'Hassan', 20345678, 'hassano', '5093334450', '173248 Maple Ln, Spokane, WA 99201', 'No', 'No', 'No', 'Yes', NULL),
(154, 'Isla', 'Khan', 20456789, 'khani', '4251112228', '174250 Walnut St, Tacoma, WA 98401', 'No', 'No', 'Yes', 'Yes', NULL),
(155, 'Leo', 'Siddiqui', 20567890, 'siddiquil2', '3601115561', '175252 Spruce Ave, Bellingham, WA 98225', 'Yes', 'No', 'No', 'Yes', NULL),
(156, 'Chloe', 'Patel', 20678901, 'patelc', '5095556672', '176254 Birch Rd, Yakima, WA 98901', 'No', 'No', 'No', 'Yes', NULL),
(157, 'Hudson', 'Kim', 20789012, 'kimh', '2063337783', '177256 Ash Ln, Bellevue, WA 98004', 'No', 'No', 'No', 'Yes', NULL),
(158, 'Nora', 'Singh', 20890123, 'singhn2', '4259990006', '178258 Oak St, Everett, WA 98201', 'Yes', 'No', 'Yes', 'Yes', NULL),
(159, 'Greyson', 'Nguyen', 20901234, 'nguyeng', '5091112351', '179260 Elm Ave, Ellensburg, WA 98926', 'No', 'No', 'No', 'Yes', NULL),
(160, 'Isabelle', 'Chen', 21012345, 'cheni', '3602223462', '180262 Pine Rd, Vancouver, WA 98660', 'No', 'No', 'No', 'Yes', NULL),
(161, 'Levi', 'Gupta', 21123456, 'guptal', '2064445684', '181264 Cedar Blvd, Issaquah, WA 98027', 'Yes', 'No', 'No', 'Yes', NULL),
(162, 'Lily', 'Shah', 21234567, 'shahl', '5096667896', '182266 Maple Ln, Wenatchee, WA 98801', 'No', 'No', 'Yes', 'Yes', NULL),
(163, 'Jace', 'Zhang', 21345678, 'zhangj2', '4257778907', '183268 Walnut St, Lynnwood, WA 98036', 'No', 'No', 'No', 'Yes', NULL),
(164, 'Ellie', 'Liu', 21456789, 'liue', '3609990129', '184270 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'No', 'No', 'Yes', NULL),
(165, 'Asher', 'Ali', 21567890, 'alia', '5091114573', '185272 Birch Rd, Moses Lake, WA 98837', 'No', 'No', 'No', 'Yes', NULL),
(166, 'Violet', 'Hassan', 21678901, 'hassanv', '2062228907', '186274 Ash Ln, Redmond, WA 98052', 'No', 'No', 'Yes', 'Yes', NULL),
(167, 'Silas', 'Khan', 21789012, 'khans', '4253334573', '187276 Oak St, Olympia, WA 98501', 'Yes', 'No', 'No', 'Yes', NULL),
(168, 'Paisley', 'Siddiqui', 21890123, 'siddiquip', '5094445684', '188278 Elm Ave, Kennewick, WA 99336', 'No', 'No', 'No', 'Yes', NULL),
(169, 'Ezra', 'Patel', 21901234, 'patele', '3605550129', '189280 Pine Rd, Bellingham, WA 98225', 'No', 'No', 'No', 'Yes', NULL),
(170, 'Piper', 'Kim', 22012345, 'kimp', '2066667896', '190282 Cedar Blvd, Kirkland, WA 98033', 'Yes', 'No', 'Yes', 'Yes', NULL),
(171, 'Luke', 'Singh', 22123456, 'singhl', '5098881240', '191284 Maple Ln, Pullman, WA 99163', 'No', 'No', 'No', 'Yes', NULL),
(172, 'Aurora', 'Reed', 30937882, 'reeda', '5095555172', '720 E 3rd Ave, Ellensburg, WA 98926', 'No', 'Yes', 'No', 'Yes', NULL),
(173, 'Benjamin', 'Young', 25735782, 'youngb', '5091234573', '340 S 1st St, Yakima, WA 98901', 'Yes', 'No', 'Yes', 'Yes', NULL),
(174, 'Charlotte', 'Gray', 36817582, 'grayc', '5092345174', '1005 University Way, Pullman, WA 99163', 'No', 'Yes', 'No', 'Yes', NULL),
(175, 'Daniel', 'Walker', 59866975, 'walkerd', '5093455775', '215 W Broadway Ave, Spokane, WA 99205', 'Yes', 'No', 'Yes', 'Yes', NULL),
(176, 'Eleanor', 'Hughes', 67357217, 'hughese', '5094565876', '455 N Wenatchee Ave, Wenatchee, WA 98801', 'No', 'No', 'No', 'Yes', NULL),
(177, 'Sophia', 'Garcia', 32985217, 'garcias', '2061234577', '123 Main St, Shoreline, WA 98133', 'Yes', 'Yes', 'No', 'Yes', NULL),
(178, 'Michael', 'Martinez', 49328780, 'martinezm', '2062345178', '456 Elm St, Bellevue, WA 98004', 'No', 'Yes', 'Yes', 'Yes', NULL),
(179, 'Grace', 'Rodriguez', 57024335, 'rodriguezg', '2063455279', '789 Pine St, Mercer Island, WA 98040', 'Yes', 'No', 'Yes', 'Yes', NULL),
(180, 'Evelyn', 'Lopez', 65739839, 'lopeze', '2064565370', '101 Maple Ave, Seattle, WA 98105', 'No', 'No', 'No', 'Yes', NULL),
(181, 'James', 'Davis', 52436159, 'davisj', '3601234571', '102 Oak St, Bellingham, WA 98225', 'Yes', 'No', 'Yes', 'Yes', NULL),
(182, 'Samantha', 'Hernandez', 60139615, 'hernandezs', '6191234572', '103 Birch Rd, La Mesa, CA 91942', 'No', 'No', 'No', 'Yes', NULL),
(183, 'Lucas', 'Wilson', 39926297, 'wilsonl', '2539304773', '104 Cedar Blvd, Federal Way, WA 98003', 'Yes', 'Yes', 'Yes', 'Yes', NULL),
(184, 'Emma', 'Moore', 54020139, 'mooree', '4259418074', '105 Spruce Ave, Everett, WA 98201', 'No', 'Yes', 'No', 'Yes', NULL),
(185, 'Henry', 'Taylor', 72312536, 'taylorh', '4259596775', '106 Ash Ln, Issaquah, WA 98027', 'Yes', 'No', 'Yes', 'Yes', NULL),
(186, 'Aubrey', 'Anderson', 23124344, 'andersona', '5034536476', '107 Oak St, Salem, OR 97301', 'No', 'No', 'Yes', 'Yes', NULL),
(187, 'Victoria', 'Thomas', 49328735, 'thomasv', '5419498777', '108 Maple Ln, Eugene, OR 97401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(188, 'Amelia', 'Jackson', 57024124, 'jacksona2', '2538291878', '109 Birch Rd, Auburn, WA 98002', 'No', 'No', 'No', 'Yes', NULL),
(189, 'Scarlett', 'Martin', 65712350, 'martins', '2539871979', '110 Cedar Blvd, Gig Harbor, WA 98335', 'Yes', 'Yes', 'Yes', 'Yes', NULL),
(190, 'Liam', 'Thompson', 52436254, 'thompsonl', '2539189220', '111 Spruce Ave, Kent, WA 98032', 'No', 'No', 'No', 'Yes', NULL),
(191, 'Eleanor', 'White', 60124113, 'whitee', '4257601331', '112 Ash Ln, Lynnwood, WA 98036', 'Yes', 'Yes', 'No', 'Yes', NULL),
(192, 'Avery', 'Harris', 39926245, 'harrisa', '4251826132', '113 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(193, 'Luna', 'Clark', 54020425, 'clarkl', '4259303143', '114 Maple Ln, Bothell, WA 98011', 'Yes', 'Yes', 'No', 'Yes', NULL),
(194, 'Natalie', 'Lewis', 60139613, 'lewisn', '5034601334', '115 Cedar Blvd, Hillsboro, OR 97124', 'No', 'No', 'Yes', 'Yes', NULL),
(195, 'Chloe', 'Walker', 39926437, 'walkerch', '5039402215', '116 Spruce Ave, Astoria, OR 97103', 'Yes', 'Yes', 'No', 'Yes', NULL),
(196, 'Isla', 'Hill', 54025439, 'hilli', '5037801336', '117 Ash Ln, Salem, OR 97301', 'No', 'No', 'Yes', 'Yes', NULL),
(197, 'Madison', 'Sanchez', 67357216, 'sanchezm', '5415556577', '118 Oak St, Bend, OR 97701', 'Yes', 'Yes', 'No', 'Yes', NULL),
(198, 'Oliver', 'Scott', 32985204, 'scotto', '5419801338', '119 Maple Ln, Eugene, OR 97401', 'No', 'No', 'Yes', 'Yes', NULL),
(199, 'Sophie', 'Ramirez', 49322318, 'ramirezs', '5413405279', '120 Cedar Blvd, Bend, OR 97701', 'Yes', 'Yes', 'No', 'Yes', NULL),
(200, 'Aria', 'Torres', 57021237, 'torresa', '5091239877', '121 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(201, 'Aiden', 'Young', 65734330, 'younga', '2067775556', '122 Ash Ln, Burien, WA 98148', 'Yes', 'Yes', 'No', 'Yes', NULL),
(202, 'Zoe', 'Nguyen', 73423456, 'nguyenz', '4259596633', '123 Oak St, Walla Walla, WA 99362', 'No', 'No', 'Yes', 'Yes', NULL),
(203, 'Bella', 'Kim', 81234568, 'kimb', '2061234579', '124 Maple Ln, Seattle, WA 98101', 'Yes', 'Yes', 'No', 'Yes', NULL),
(204, 'Isaac', 'Lee', 82345679, 'leei', '5093334446', '125 Cedar Blvd, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(205, 'Sebastian', 'Garcia', 83456780, 'garcias2', '4251112226', '126 Spruce Ave, Tacoma, WA 98401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(206, 'Lily', 'Chen', 84567891, 'chenl', '3601115556', '127 Ash Ln, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(207, 'Julian', 'Tran', 85678902, 'tranj', '5095556668', '128 Oak St, Yakima, WA 98901', 'Yes', 'Yes', 'No', 'Yes', NULL),
(208, 'Penelope', 'Gupta', 86789013, 'guptap', '2063337778', '129 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(209, 'David', 'Singh', 87890124, 'singhd', '4259990006', '130 Cedar Blvd, Everett, WA 98201', 'Yes', 'Yes', 'No', 'Yes', NULL),
(210, 'Elizabeth', 'Shah', 88901235, 'shahe2', '5091112348', '131 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(211, 'Lucas', 'Hassan', 89012346, 'hassanl4', '3602223456', '132 Ash Ln, Vancouver, WA 98660', 'Yes', 'Yes', 'No', 'Yes', NULL),
(212, 'Daniel', 'Patel', 90123457, 'pateld', '2064445679', '133 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(213, 'Ava', 'Johnson', 91234568, 'johnsona2', '5096667890', '134 Maple Ln, Wenatchee, WA 98801', 'Yes', 'Yes', 'No', 'Yes', NULL),
(214, 'Oliver', 'Davis', 92345679, 'daviso', '4257778911', '135 Cedar Blvd, Lynnwood, WA 98036', 'No', 'No', 'Yes', 'Yes', NULL),
(215, 'Sofia', 'Miller', 93456780, 'millers', '3609990123', '136 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'Yes', 'No', 'Yes', NULL),
(216, 'Ella', 'Wilson', 94567891, 'wilsone', '5091114567', '137 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'Yes', 'Yes', NULL),
(217, 'Scarlett', 'Taylor', 95678902, 'taylors', '2062228901', '138 Oak St, Redmond, WA 98052', 'Yes', 'Yes', 'No', 'Yes', NULL),
(218, 'Aiden', 'Martinez', 96789013, 'martineza', '4253334567', '139 Maple Ln, Olympia, WA 98501', 'No', 'No', 'Yes', 'Yes', NULL),
(219, 'Emily', 'Hernandez', 97890124, 'hernandeze', '5094445678', '140 Cedar Blvd, Kennewick, WA 99336', 'Yes', 'Yes', 'No', 'Yes', NULL),
(220, 'Ryan', 'Lopez', 98901235, 'lopezr', '3605550123', '141 Spruce Ave, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(221, 'James', 'Brown', 99012346, 'brownj', '2066667890', '142 Ash Ln, Kirkland, WA 98033', 'Yes', 'Yes', 'No', 'Yes', NULL),
(222, 'Victoria', 'Jones', 10123457, 'jonesv', '5098881234', '143 Oak St, Pullman, WA 99163', 'No', 'No', 'Yes', 'Yes', NULL),
(223, 'Jackson', 'Garcia', 10234568, 'garciaj2', '2061234569', '144 Maple Ln, Seattle, WA 98101', 'Yes', 'Yes', 'No', 'Yes', NULL),
(224, 'Grace', 'Smith', 10345679, 'smithg', '5093334445', '145 Cedar Blvd, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(225, 'Evelyn', 'Martinez', 10456780, 'martineze', '4251112223', '146 Spruce Ave, Tacoma, WA 98401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(226, 'Zoe', 'Nguyen', 10567891, 'nguyenz1', '3601115556', '147 Ash Ln, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(227, 'Logan', 'Chen', 10678902, 'chenl1', '5095556667', '148 Oak St, Yakima, WA 98901', 'Yes', 'Yes', 'No', 'Yes', NULL),
(228, 'Lily', 'Hernandez', 10789013, 'hernandezl', '2063337778', '149 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(229, 'James', 'Singh', 10890124, 'singhj1', '4259990001', '150 Cedar Blvd, Everett, WA 98201', 'Yes', 'Yes', 'No', 'Yes', NULL),
(230, 'Aria', 'Shah', 10901235, 'shaha', '5091112346', '151 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(231, 'Liam', 'Kim', 11012346, 'kiml', '3602223457', '152 Ash Ln, Vancouver, WA 98660', 'Yes', 'Yes', 'No', 'Yes', NULL),
(232, 'Ava', 'Patel', 11123457, 'patela3', '2064445679', '153 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(233, 'Harper', 'Johnson', 11234568, 'johnsonh', '5096667891', '154 Maple Ln, Wenatchee, WA 98801', 'Yes', 'Yes', 'No', 'Yes', NULL),
(234, 'Sophie', 'Davis', 11345679, 'daviss', '4257778902', '155 Cedar Blvd, Lynnwood, WA 98036', 'No', 'No', 'Yes', 'Yes', NULL),
(235, 'Ryan', 'Brown', 11456780, 'brownr', '3609990124', '156 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'Yes', 'No', 'Yes', NULL),
(236, 'Emma', 'Miller', 11567891, 'millere', '5091114568', '157 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'Yes', 'Yes', NULL),
(237, 'Liam', 'Wilson', 11678902, 'wilsonl1', '2062228902', '158 Oak St, Redmond, WA 98052', 'Yes', 'Yes', 'No', 'Yes', NULL),
(238, 'Chloe', 'Taylor', 11789013, 'taylorc', '4253334568', '159 Maple Ln, Olympia, WA 98501', 'No', 'No', 'Yes', 'Yes', NULL),
(239, 'Julian', 'Martinez', 11890124, 'martinezj', '5094445679', '160 Cedar Blvd, Kennewick, WA 99336', 'Yes', 'Yes', 'No', 'Yes', NULL),
(240, 'Daniel', 'Lopez', 11901235, 'lopezd', '3605550124', '161 Spruce Ave, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(241, 'Isla', 'Brown', 12012346, 'browni', '2066667891', '162 Ash Ln, Kirkland, WA 98033', 'Yes', 'Yes', 'No', 'Yes', NULL),
(242, 'Ella', 'Garcia', 12123457, 'garciae', '5098881235', '163 Oak St, Pullman, WA 99163', 'No', 'No', 'Yes', 'Yes', NULL),
(243, 'Benjamin', 'Smith', 12234568, 'smithb', '2061234570', '164 Maple Ln, Seattle, WA 98101', 'Yes', 'Yes', 'No', 'Yes', NULL),
(244, 'Evelyn', 'Garcia', 12345679, 'garciae1', '5093334446', '165 Cedar Blvd, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(245, 'Victoria', 'Nguyen', 12456780, 'nguyenv', '4251112224', '166 Spruce Ave, Tacoma, WA 98401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(246, 'Oliver', 'Chen', 12567891, 'cheno', '3601115557', '167 Ash Ln, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(247, 'Ryan', 'Tran', 12678902, 'tranr', '5095556668', '168 Oak St, Yakima, WA 98901', 'Yes', 'Yes', 'No', 'Yes', NULL),
(248, 'Grace', 'Gupta', 12789013, 'guptag', '2063337779', '169 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(249, 'Sophia', 'Singh', 12890124, 'singhs', '4259990002', '170 Cedar Blvd, Everett, WA 98201', 'Yes', 'Yes', 'No', 'Yes', NULL),
(250, 'Layla', 'Shah', 12901235, 'shahl1', '5091112347', '171 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(251, 'Luke', 'Kim', 13012346, 'kiml1', '3602223458', '172 Ash Ln, Vancouver, WA 98660', 'Yes', 'Yes', 'No', 'Yes', NULL),
(252, 'Luna', 'Patel', 13123457, 'patell1', '2064445680', '173 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(253, 'Eleanor', 'Johnson', 13234568, 'johnsone', '5096667892', '174 Maple Ln, Wenatchee, WA 98801', 'Yes', 'Yes', 'No', 'Yes', NULL),
(254, 'Ella', 'Davis', 13345679, 'davise', '4257778903', '175 Cedar Blvd, Lynnwood, WA 98036', 'No', 'No', 'Yes', 'Yes', NULL),
(255, 'Michael', 'Brown', 13456780, 'brownm1', '3609990125', '176 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'Yes', 'No', 'Yes', NULL),
(256, 'Aiden', 'Miller', 13567891, 'millera', '5091114569', '177 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'Yes', 'Yes', NULL),
(257, 'Olivia', 'Wilson', 13678902, 'wilsono', '2062228903', '178 Oak St, Redmond, WA 98052', 'Yes', 'Yes', 'No', 'Yes', NULL),
(258, 'Noah', 'Taylor', 13789013, 'taylorn', '4253334569', '179 Maple Ln, Olympia, WA 98501', 'No', 'No', 'Yes', 'Yes', NULL),
(259, 'Zoey', 'Martinez', 13890124, 'martinezz', '5094445680', '180 Cedar Blvd, Kennewick, WA 99336', 'Yes', 'Yes', 'No', 'Yes', NULL),
(260, 'Riley', 'Lopez', 13901235, 'lopezr1', '3605550125', '181 Spruce Ave, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(261, 'Ella', 'Brown', 14012346, 'browne', '2066667892', '182 Ash Ln, Kirkland, WA 98033', 'Yes', 'Yes', 'No', 'Yes', NULL),
(262, 'Victoria', 'Garcia', 14123457, 'garciav', '5098881236', '183 Oak St, Pullman, WA 99163', 'No', 'No', 'Yes', 'Yes', NULL),
(263, 'Zoe', 'Smith', 14234568, 'smithz', '2061234571', '184 Maple Ln, Seattle, WA 98101', 'Yes', 'Yes', 'No', 'Yes', NULL),
(264, 'Julian', 'Garcia', 14345679, 'garciaj1', '5093334447', '185 Cedar Blvd, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(265, 'Emily', 'Nguyen', 14456780, 'nguyene4', '4251112225', '186 Spruce Ave, Tacoma, WA 98401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(266, 'Grace', 'Chen', 14567891, 'cheng', '3601115558', '187 Ash Ln, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(267, 'Liam', 'Tran', 14678902, 'tranl', '5095556669', '188 Oak St, Yakima, WA 98901', 'Yes', 'Yes', 'No', 'Yes', NULL),
(268, 'Samantha', 'Gupta', 14789013, 'guptas', '2063337780', '189 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(269, 'Benjamin', 'Singh', 14890124, 'singhb', '4259990003', '190 Cedar Blvd, Everett, WA 98201', 'Yes', 'Yes', 'No', 'Yes', NULL),
(270, 'Aria', 'Shah', 14901235, 'shaha1', '5091112348', '191 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(271, 'Lily', 'Kim', 15012346, 'kiml2', '3602223459', '192 Ash Ln, Vancouver, WA 98660', 'Yes', 'Yes', 'No', 'Yes', NULL),
(272, 'Ava', 'Patel', 15123457, 'patela1', '2064445681', '193 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(273, 'Jackson', 'Johnson', 15234568, 'johnsonj', '5096667893', '194 Maple Ln, Wenatchee, WA 98801', 'Yes', 'Yes', 'No', 'Yes', NULL),
(274, 'Ella', 'Davis', 15345679, 'davise1', '4257778904', '195 Cedar Blvd, Lynnwood, WA 98036', 'No', 'No', 'Yes', 'Yes', NULL),
(275, 'Scarlett', 'Brown', 15456780, 'browns', '3609990126', '196 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'Yes', 'No', 'Yes', NULL),
(276, 'Michael', 'Miller', 15567891, 'millerm', '5091114570', '197 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'Yes', 'Yes', NULL),
(277, 'Aiden', 'Wilson', 15678902, 'wilsona', '2062228904', '198 Oak St, Redmond, WA 98052', 'Yes', 'Yes', 'No', 'Yes', NULL),
(278, 'Lucas', 'Taylor', 15789013, 'taylorl2', '4253334570', '199 Maple Ln, Olympia, WA 98501', 'No', 'No', 'Yes', 'Yes', NULL),
(279, 'Ella', 'Martinez', 15890124, 'martineze1', '5094445681', '200 Cedar Blvd, Kennewick, WA 99336', 'Yes', 'Yes', 'No', 'Yes', NULL),
(280, 'Chloe', 'Lopez', 15901235, 'lopezc', '3605550126', '201 Spruce Ave, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(281, 'James', 'Brown', 16012346, 'brownj1', '2066667893', '202 Ash Ln, Kirkland, WA 98033', 'Yes', 'Yes', 'No', 'Yes', NULL),
(282, 'Victoria', 'Garcia', 16123457, 'garciav1', '5098881237', '203 Oak St, Pullman, WA 99163', 'No', 'No', 'Yes', 'Yes', NULL),
(283, 'Luke', 'Smith', 16234568, 'smithl', '2061234572', '204 Maple Ln, Seattle, WA 98101', 'Yes', 'Yes', 'No', 'Yes', NULL),
(284, 'Isla', 'Garcia', 16345679, 'garciai', '5093334448', '205 Cedar Blvd, Spokane, WA 99201', 'No', 'No', 'Yes', 'Yes', NULL),
(285, 'Benjamin', 'Nguyen', 16456780, 'nguyenb1', '4251112226', '206 Spruce Ave, Tacoma, WA 98401', 'Yes', 'Yes', 'No', 'Yes', NULL),
(286, 'Aria', 'Chen', 16567891, 'chena1', '3601115559', '207 Ash Ln, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL),
(287, 'Sophie', 'Tran', 16678902, 'trans1', '5095556670', '208 Oak St, Yakima, WA 98901', 'Yes', 'Yes', 'No', 'Yes', NULL),
(288, 'Aiden', 'Gupta', 16789013, 'guptaa1', '2063337781', '209 Maple Ln, Bellevue, WA 98004', 'No', 'No', 'Yes', 'Yes', NULL),
(289, 'Victoria', 'Singh', 16890124, 'singhv', '4259990004', '210 Cedar Blvd, Everett, WA 98201', 'Yes', 'Yes', 'No', 'Yes', NULL),
(290, 'Zoe', 'Shah', 16901235, 'shahz', '5091112349', '211 Spruce Ave, Ellensburg, WA 98926', 'No', 'No', 'Yes', 'Yes', NULL),
(291, 'Luke', 'Kim', 17012346, 'kiml3', '3602223460', '212 Ash Ln, Vancouver, WA 98660', 'Yes', 'Yes', 'No', 'Yes', NULL),
(292, 'Scarlett', 'Patel', 17123457, 'patels', '2064445682', '213 Oak St, Issaquah, WA 98027', 'No', 'No', 'Yes', 'Yes', NULL),
(293, 'Grace', 'Johnson', 17234568, 'johngrace', '5096667894', '214 Maple Ln, Wenatchee, WA 98801', 'Yes', 'Yes', 'No', 'Yes', NULL),
(294, 'Henry', 'Davis', 17345679, 'davish', '4257778905', '215 Cedar Blvd, Lynnwood, WA 98036', 'No', 'No', 'Yes', 'Yes', NULL),
(295, 'Ava', 'Brown', 17456780, 'browna', '3609990127', '216 Spruce Ave, Mount Vernon, WA 98273', 'Yes', 'Yes', 'No', 'Yes', NULL),
(296, 'Michael', 'Miller', 17567891, 'millerm1', '5091114571', '217 Ash Ln, Moses Lake, WA 98837', 'No', 'No', 'Yes', 'Yes', NULL),
(297, 'Evelyn', 'Wilson', 17678902, 'wilsone1', '2062228905', '218 Oak St, Redmond, WA 98052', 'Yes', 'Yes', 'No', 'Yes', NULL),
(298, 'Lucas', 'Taylor', 17789013, 'taylorl1', '4253334571', '219 Maple Ln, Olympia, WA 98501', 'No', 'No', 'Yes', 'Yes', NULL),
(299, 'Ella', 'Martinez', 17890124, 'martineze2', '5094445682', '220 Cedar Blvd, Kennewick, WA 99336', 'Yes', 'Yes', 'No', 'Yes', NULL),
(300, 'Liam', 'Lopez', 17901235, 'lopezl', '3605550127', '221 Spruce Ave, Bellingham, WA 98225', 'No', 'No', 'Yes', 'Yes', NULL);

INSERT INTO `user_programs` (`id`, `user_id`, `program_id`, `can_edit`, `sequence`) VALUES
(1, 2, 1, 'YES', NULL), -- Judd Grey, CS Advisor (Computer Science, BS)
(2, 3, 1, 'YES', NULL), -- Eva Whitsett, CS Advisor (Computer Science, BS)
(3, 9, 1, 'YES', NULL), -- Chris Stone, CS Secretary (Computer Science, BS)
(4, 10, 6, 'YES', NULL), -- Chris Black, Math Director (Mathematics: Middle Level Education, BA)
(5, 11, 6, 'YES', NULL), -- Rachel George, Director Area Math (Mathematics: Middle Level Education, BA)
(6, 12, 6, 'YES', NULL), -- Anne Egger, Science/Math Professor (Mathematics: Middle Level Education, BA)
(7, 13, 4, 'YES', NULL), -- Bruce Palmquist, Physics (Physics, BS)
(8, 14, 5, 'YES', NULL), -- Emilie Hancock, Secondary Math Education Director (STEM Teaching Program, BA)
(9, 15, 2, 'YES', NULL), -- Dominic Klyve, Data Science Director (Data Science, BS, Computational Data Science Specialization)
(10, 16, 6, 'YES', NULL), -- Peter Klosterman, Middle Level Education Director (Mathematics: Middle Level Education, BA)
(11, 18, 1, 'YES', NULL), -- Mike Pease, CS Director (Computer Science, BS)
(12, 19, 6, 'YES', NULL), -- Aaron Montgomery, Math Professor (Mathematics: Middle Level Education, BA)
(13, 20, 6, 'YES', NULL), -- Sooie-Hoe Loke, Math Professor (Mathematics: Middle Level Education, BA)
(14, 21, 5, 'YES', NULL); -- Megan McConnell, Unknown Transfer Director (STEM Teaching Program, BA)

INSERT INTO `student_programs` (`id`, `student_id`, `program_id`, `user_id`) VALUES
(1, 1, 1, 2),  -- John Smith to Program 1, Judd Grey
(2, 2, 2, 15),  -- Amanda Hunter to Program 2, Dominic Klyve
(3, 3, 4, 13),  -- Tracey Larson to Program 4, Bruce Palmquist
(4, 4, 5, 14),  -- Marilyn Cooper to Program 5, Emilie Hancock
(5, 5, 6, 10),  -- Lacey Fuentes to Program 6, Peter Klosterman
(6, 6, 1, 3),  -- Casey Nelson to Program 1, Eva Whitsett
(7, 7, 2, 15),  -- Brandon Evans to Program 2, Dominic Klyve
(8, 8, 4, 13),  -- Timothy Silva to Program 4, Bruce Palmquist
(9, 9, 5, 14),  -- Catherine Williams to Program 5, Emilie Hancock
(10, 10, 6, 10), -- Matthew Brown to Program 6, Peter Klosterman
(11, 11, 3, 6), -- Donald Smith to Program 3, No advisor listed for Art Major, BA
(12, 12, 1, 9), -- Sarah Wright to Program 1, Chris Stone
(13, 13, 2, 15), -- Jacob Jackson to Program 2, Dominic Klyve
(14, 14, 4, 13), -- Miranda Bell to Program 4, Bruce Palmquist
(15, 15, 5, 14), -- Pedro Pascal to Program 5, Emilie Hancock
(16, 16, 6, 10), -- Liam Berry to Program 6, Peter Klosterman
(17, 17, 1, 18), -- Ed Sheer to Program 1, Mike Pease
(18, 18, 2, 15), -- Eduardo Villa to Program 2, Dominic Klyve
(19, 19, 3, 6), -- Max Deere to Program 3, No advisor listed for Art Major, BA
(20, 20, 3, 6), -- Mark Henry to Program 3, No advisor listed for Art Major, BA
(21, 21, 1, 2), -- John Cena to Program 1, Judd Grey
(22, 22, 2, 15), -- Brandy Martinez to Program 2, Dominic Klyve
(23, 23, 3, 6), -- Jake Robin to Program 3, No advisor listed for Art Major, BA
(24, 24, 4, 13), -- Eve Clancy to Program 4, Bruce Palmquist
(25, 25, 5, 14), -- Hunter Helmsy to Program 5, Emilie Hancock
(26, 26, 5, 14), -- Israel Sanchez to Program 5, Emilie Hancock
(27, 27, 6, 10), -- Cassie Yeung to Program 6, Peter Klosterman
(28, 28, 1, 3), -- Miguel Fernandez to Program 1, Eva Whitsett
(29, 29, 2, 15), -- Miguel Fernandez to Program 2, Dominic Klyve
(30, 30, 1, 9), -- Cat Mendez to Program 1, Chris Stone
(31, 31, 2, 15), -- Melissa Campos to Program 2, Dominic Klyve
(32, 32, 1, 2), -- Emily Nguyen to Program 1, Judd Grey
(33, 33, 2, 15), -- David Lee to Program 2, Dominic Klyve
(34, 34, 1, 18), -- Jessica Garcia to Program 1, Mike Pease
(35, 35, 2, 15), -- Andrew Chen to Program 2, Dominic Klyve
(36, 36, 4, 13), -- Samantha Tran to Program 4, Bruce Palmquist
(37, 37, 1, 3), -- Daniel Hernandez to Program 1, Eva Whitsett
(38, 38, 1, 9), -- Olivia Lopez to Program 1, Chris Stone
(39, 39, 2, 15), -- Ethan Nguyen to Program 2, Dominic Klyve
(40, 40, 4, 13), -- Sophia Tran to Program 4, Bruce Palmquist
(41, 41, 1, 2), -- Ryan Kim to Program 1, Judd Grey
(42, 42, 1, 18), -- Avery Johnson to Program 1, Mike Pease
(43, 43, 2, 15), -- Natalie Davis to Program 2, Dominic Klyve
(44, 44, 4, 13), -- Joseph Wilson to Program 4, Bruce Palmquist
(45, 45, 1, 9), -- Madison Anderson to Program 1, Chris Stone
(46, 46, 1, 2), -- Logan Taylor to Program 1, Judd Grey
(47, 47, 2, 15), -- Chloe Moore to Program 2, Dominic Klyve
(48, 48, 4, 13), -- Aiden Jackson to Program 4, Bruce Palmquist
(49, 49, 1, 3), -- Elizabeth Martin to Program 1, Eva Whitsett
(50, 50, 1, 18), -- William Thompson to Program 1, Mike Pease
(51, 51, 2, 15), -- Grace White to Program 2, Dominic Klyve
(52, 52, 4, 13), -- Liam Patel to Program 4, Bruce Palmquist
(53, 53, 5, 14), -- Emma Kim to Program 5, Emilie Hancock
(54, 54, 6, 10), -- Noah Singh to Program 6, Peter Klosterman
(55, 55, 1, 3), -- Olivia Nguyen to Program 1, Eva Whitsett
(56, 56, 2, 15), -- Ava Chen to Program 2, Dominic Klyve
(57, 57, 4, 13), -- Elijah Gupta to Program 4, Bruce Palmquist
(58, 58, 1, 2), -- Sophia Shah to Program 1, Judd Grey
(59, 59, 1, 9), -- William Zhang to Program 1, Chris Stone
(60, 60, 2, 15), -- Isabella Liu to Program 2, Dominic Klyve
(61, 61, 1, 3), -- James Ali to Program 1, Eva Whitsett
(62, 62, 1, 18), -- Charlotte Hassan to Program 1, Mike Pease
(63, 63, 2, 15), -- Benjamin Khan to Program 2, Dominic Klyve
(64, 64, 4, 13), -- Amelia Siddiqui to Program 4, Bruce Palmquist
(65, 65, 1, 2), -- Lucas Patel to Program 1, Judd Grey
(66, 66, 2, 15), -- Mia Kim to Program 2, Dominic Klyve
(67, 67, 1, 3), -- Henry Singh to Program 1, Eva Whitsett
(68, 68, 1, 18), -- Evelyn Nguyen to Program 1, Mike Pease
(69, 69, 2, 15), -- Alexander Chen to Program 2, Dominic Klyve
(70, 70, 4, 13), -- Harper Gupta to Program 4, Bruce Palmquist
(71, 71, 1, 9), -- Daniel Shah to Program 1, Chris Stone
(72, 72, 2, 15), -- Abigail Zhang to Program 2, Dominic Klyve
(73, 73, 1, 2), -- Matthew Liu to Program 1, Judd Grey
(74, 74, 1, 3), -- Emily Ali to Program 1, Eva Whitsett
(75, 75, 2, 15), -- Michael Hassan to Program 2, Dominic Klyve
(76, 76, 4, 13), -- Elizabeth Khan to Program 4, Bruce Palmquist
(77, 77, 1, 18), -- Ethan Siddiqui to Program 1, Mike Pease
(78, 78, 2, 15), -- Avery Patel to Program 2, Dominic Klyve
(79, 79, 1, 9), -- Sofia Kim to Program 1, Chris Stone
(80, 80, 2, 15), -- Jacob Singh to Program 2, Dominic Klyve
(81, 81, 4, 13), -- Scarlett Nguyen to Program 4, Bruce Palmquist
(82, 82, 1, 2), -- Joseph Chen to Program 1, Judd Grey
(83, 83, 1, 3), -- Victoria Gupta to Program 1, Eva Whitsett
(84, 84, 2, 15), -- David Shah to Program 2, Dominic Klyve
(85, 85, 1, 18), -- Grace Zhang to Program 1, Mike Pease
(86, 86, 4, 13), -- Levi Liu to Program 4, Bruce Palmquist
(87, 87, 1, 9), -- Natalie Ali to Program 1, Chris Stone
(88, 88, 2, 15), -- Samuel Hassan to Program 2, Dominic Klyve
(89, 89, 1, 2), -- Chloe Khan to Program 1, Judd Grey
(90, 90, 2, 15), -- Aiden Siddiqui to Program 2, Dominic Klyve
(91, 91, 4, 13), -- Aria Patel to Program 4, Bruce Palmquist
(92, 92, 1, 3), -- Jackson Kim to Program 1, Eva Whitsett
(93, 93, 2, 15), -- Ella Singh to Program 2, Dominic Klyve
(94, 94, 1, 18), -- Sebastian Nguyen to Program 1, Mike Pease
(95, 95, 1, 9), -- Zoe Chen to Program 1, Chris Stone
(96, 96, 2, 15), -- Carter Gupta to Program 2, Dominic Klyve
(97, 97, 1, 2), -- Penelope Shah to Program 1, Judd Grey
(98, 98, 2, 15), -- Julian Zhang to Program 2, Dominic Klyve
(99, 99, 1, 3), -- Lily Liu to Program 1, Eva Whitsett
(100, 100, 2, 15), -- Jack Ali to Program 2, Dominic Klyve
(101, 101, 1, 18), -- Lillian Hassan to Program 1, Mike Pease
(102, 102, 2, 15), -- Ryan Khan to Program 2, Dominic Klyve
(103, 103, 4, 13), -- Nora Siddiqui to Program 4, Bruce Palmquist
(104, 104, 1, 9), -- Luke Patel to Program 1, Chris Stone
(105, 105, 2, 15), -- Addison Kim to Program 2, Dominic Klyve
(106, 106, 4, 13), -- Gabriel Singh to Program 4, Bruce Palmquist
(107, 107, 1, 2), -- Hazel Nguyen to Program 1, Judd Grey
(108, 108, 1, 3), -- Caleb Chen to Program 1, Eva Whitsett
(109, 109, 2, 15), -- Aubrey Gupta to Program 2, Dominic Klyve
(110, 110, 4, 13), -- Owen Shah to Program 4, Bruce Palmquist
(111, 111, 1, 18), -- Willow Zhang to Program 1, Mike Pease
(112, 112, 2, 15), -- Wyatt Liu to Program 2, Dominic Klyve
(113, 113, 4, 13), -- Hannah Ali to Program 4, Bruce Palmquist
(114, 114, 1, 9), -- Landon Hassan to Program 1, Chris Stone
(115, 115, 2, 15), -- Everly Khan to Program 2, Dominic Klyve
(116, 116, 1, 2), -- Liam Siddiqui to Program 1, Judd Grey
(117, 117, 2, 15), -- Mackenzie Patel to Program 2, Dominic Klyve
(118, 118, 4, 13), -- Elias Kim to Program 4, Bruce Palmquist
(119, 119, 1, 3), -- Aubree Singh to Program 1, Eva Whitsett
(120, 120, 2, 15), -- Connor Nguyen to Program 2, Dominic Klyve
(121, 121, 4, 13), -- Paisley Chen to Program 4, Bruce Palmquist
(122, 122, 1, 18), -- Ezra Gupta to Program 1, Mike Pease
(123, 123, 2, 15), -- Emilia Shah to Program 2, Dominic Klyve
(124, 124, 4, 13), -- Thomas Zhang to Program 4, Bruce Palmquist
(125, 125, 1, 9), -- Hadley Liu to Program 1, Chris Stone
(126, 126, 2, 15), -- Finn Ali to Program 2, Dominic Klyve
(127, 127, 4, 13), -- Layla Hassan to Program 4, Bruce Palmquist
(128, 128, 1, 2), -- Aiden Khan to Program 1, Judd Grey
(129, 129, 2, 15), -- Adalyn Siddiqui to Program 2, Dominic Klyve
(130, 130, 4, 13), -- Grayson Patel to Program 4, Bruce Palmquist
(131, 131, 1, 3), -- Amaya Kim to Program 1, Eva Whitsett
(132, 132, 2, 15), -- Oliver Singh to Program 2, Dominic Klyve
(133, 133, 4, 13), -- Mila Nguyen to Program 4, Bruce Palmquist
(134, 134, 1, 18), -- Elijah Chen to Program 1, Mike Pease
(135, 135, 2, 15), -- Ivy Gupta to Program 2, Dominic Klyve
(136, 136, 4, 13), -- Jayden Shah to Program 4, Bruce Palmquist
(137, 137, 1, 9), -- Harper Zhang to Program 1, Chris Stone
(138, 138, 2, 15), -- Mason Liu to Program 2, Dominic Klyve
(139, 139, 1, 2), -- Ella Ali to Program 1, Judd Grey
(140, 140, 2, 15), -- Aria Hassan to Program 2, Dominic Klyve
(141, 141, 4, 13), -- Logan Khan to Program 4, Bruce Palmquist
(142, 142, 1, 3), -- Everly Siddiqui to Program 1, Eva Whitsett
(143, 143, 2, 15), -- Henry Patel to Program 2, Dominic Klyve
(144, 144, 1, 18), -- Violet Kim to Program 1, Mike Pease
(145, 145, 2, 15), -- William Singh to Program 2, Dominic Klyve
(146, 146, 4, 13), -- Nova Nguyen to Program 4, Bruce Palmquist
(147, 147, 1, 9), -- Jack Chen to Program 1, Chris Stone
(148, 148, 2, 15), -- Aurora Gupta to Program 2, Dominic Klyve
(149, 149, 1, 2), -- James Shah to Program 1, Judd Grey
(150, 150, 2, 15), -- Scarlett Zhang to Program 2, Dominic Klyve
(151, 151, 1, 3), -- Theodore Liu to Program 1, Eva Whitsett
(152, 152, 2, 15), -- Hazel Ali to Program 2, Dominic Klyve
(153, 153, 4, 13), -- Owen Hassan to Program 4, Bruce Palmquist
(154, 154, 1, 18), -- Isla Khan to Program 1, Mike Pease
(155, 155, 2, 15), -- Leo Siddiqui to Program 2, Dominic Klyve
(156, 156, 4, 13), -- Chloe Patel to Program 4, Bruce Palmquist
(157, 157, 1, 9), -- Hudson Kim to Program 1, Chris Stone
(158, 158, 2, 15), -- Nora Singh to Program 2, Dominic Klyve
(159, 159, 1, 2), -- Greyson Nguyen to Program 1, Judd Grey
(160, 160, 2, 15), -- Isabelle Chen to Program 2, Dominic Klyve
(161, 161, 4, 13), -- Levi Gupta to Program 4, Bruce Palmquist
(162, 162, 1, 3), -- Lily Shah to Program 1, Eva Whitsett
(163, 163, 2, 15), -- Jace Zhang to Program 2, Dominic Klyve
(164, 164, 4, 13), -- Ellie Liu to Program 4, Bruce Palmquist
(165, 165, 1, 18), -- Asher Ali to Program 1, Mike Pease
(166, 166, 2, 15), -- Violet Hassan to Program 2, Dominic Klyve
(167, 167, 4, 13), -- Silas Khan to Program 4, Bruce Palmquist
(168, 168, 1, 9), -- Paisley Siddiqui to Program 1, Chris Stone
(169, 169, 2, 15), -- Ezra Patel to Program 2, Dominic Klyve
(170, 170, 4, 13), -- Piper Kim to Program 4, Bruce Palmquist
(171, 171, 1, 2), -- Luke Singh to Program 1, Judd Grey
(172, 172, 4, 13), -- Aurora Reed to Program 4, Bruce Palmquist
(173, 173, 2, 15), -- Benjamin Young to Program 2, Dominic Klyve
(174, 174, 1, 3), -- Charlotte Gray to Program 1, Eva Whitsett
(175, 175, 4, 13), -- Daniel Walker to Program 4, Bruce Palmquist
(176, 176, 1, 18), -- Eleanor Hughes to Program 1, Mike Pease
(177, 177, 2, 15), -- Sophia Garcia to Program 2, Dominic Klyve
(178, 178, 4, 13), -- Michael Martinez to Program 4, Bruce Palmquist
(179, 179, 1, 9), -- Grace Rodriguez to Program 1, Chris Stone
(180, 180, 2, 15), -- Evelyn Lopez to Program 2, Dominic Klyve
(181, 181, 1, 2), -- James Davis to Program 1, Judd Grey
(182, 182, 2, 15), -- Samantha Hernandez to Program 2, Dominic Klyve
(183, 183, 4, 13), -- Lucas Wilson to Program 4, Bruce Palmquist
(184, 184, 1, 3), -- Emma Moore to Program 1, Eva Whitsett
(185, 185, 2, 15), -- Henry Taylor to Program 2, Dominic Klyve
(186, 186, 4, 13), -- Aubrey Anderson to Program 4, Bruce Palmquist
(187, 187, 1, 18), -- Victoria Thomas to Program 1, Mike Pease
(188, 188, 2, 15), -- Amelia Jackson to Program 2, Dominic Klyve
(189, 189, 4, 13), -- Scarlett Martin to Program 4, Bruce Palmquist
(190, 190, 1, 9), -- Liam Thompson to Program 1, Chris Stone
(191, 191, 2, 15), -- Eleanor White to Program 2, Dominic Klyve
(192, 192, 4, 13), -- Avery Harris to Program 4, Bruce Palmquist
(193, 193, 1, 2), -- Luna Clark to Program 1, Judd Grey
(194, 194, 2, 15), -- Natalie Lewis to Program 2, Dominic Klyve
(195, 195, 4, 13), -- Chloe Walker to Program 4, Bruce Palmquist
(196, 196, 1, 3), -- Isla Hill to Program 1, Eva Whitsett
(197, 197, 2, 15), -- Madison Sanchez to Program 2, Dominic Klyve
(198, 198, 4, 13), -- Oliver Scott to Program 4, Bruce Palmquist
(199, 199, 1, 18), -- Sophie Ramirez to Program 1, Mike Pease
(200, 200, 2, 15), -- Aria Torres to Program 2, Dominic Klyve
(201, 201, 4, 13), -- Aiden Young to Program 4, Bruce Palmquist
(202, 202, 1, 9), -- Zoe Nguyen to Program 1, Chris Stone
(203, 203, 2, 15), -- Bella Kim to Program 2, Dominic Klyve
(204, 204, 4, 13), -- Isaac Lee to Program 4, Bruce Palmquist
(205, 205, 1, 2), -- Sebastian Garcia to Program 1, Judd Grey
(206, 206, 2, 15), -- Lily Chen to Program 2, Dominic Klyve
(207, 207, 4, 13), -- Julian Tran to Program 4, Bruce Palmquist
(208, 208, 1, 3), -- Penelope Gupta to Program 1, Eva Whitsett
(209, 209, 2, 15), -- David Singh to Program 2, Dominic Klyve
(210, 210, 4, 13), -- Elizabeth Shah to Program 4, Bruce Palmquist
(211, 211, 1, 18), -- Lucas Hassan to Program 1, Mike Pease
(212, 212, 2, 15), -- Daniel Patel to Program 2, Dominic Klyve
(213, 213, 4, 13), -- Ava Johnson to Program 4, Bruce Palmquist
(214, 214, 1, 9), -- Oliver Davis to Program 1, Chris Stone
(215, 215, 2, 15), -- Sofia Miller to Program 2, Dominic Klyve
(216, 216, 4, 13), -- Ella Wilson to Program 4, Bruce Palmquist
(217, 217, 1, 2), -- Scarlett Taylor to Program 1, Judd Grey
(218, 218, 2, 15), -- Aiden Martinez to Program 2, Dominic Klyve
(219, 219, 4, 13), -- Emily Hernandez to Program 4, Bruce Palmquist
(220, 220, 1, 3), -- Ryan Lopez to Program 1, Eva Whitsett
(221, 221, 2, 15), -- James Brown to Program 2, Dominic Klyve
(222, 222, 4, 13), -- Victoria Jones to Program 4, Bruce Palmquist
(223, 223, 1, 18), -- Jackson Garcia to Program 1, Mike Pease
(224, 224, 2, 15), -- Grace Smith to Program 2, Dominic Klyve
(225, 225, 4, 13), -- Evelyn Martinez to Program 4, Bruce Palmquist
(226, 226, 1, 9), -- Zoe Nguyen to Program 1, Chris Stone
(227, 227, 2, 15), -- Logan Chen to Program 2, Dominic Klyve
(228, 228, 4, 13), -- Lily Hernandez to Program 4, Bruce Palmquist
(229, 229, 1, 2), -- James Singh to Program 1, Judd Grey
(230, 230, 2, 15), -- Aria Shah to Program 2, Dominic Klyve
(231, 231, 4, 13), -- Liam Kim to Program 4, Bruce Palmquist
(232, 232, 1, 3), -- Ava Patel to Program 1, Eva Whitsett
(233, 233, 2, 15), -- Harper Johnson to Program 2, Dominic Klyve
(234, 234, 4, 13), -- Sophie Davis to Program 4, Bruce Palmquist
(235, 235, 1, 18), -- Ryan Brown to Program 1, Mike Pease
(236, 236, 2, 15), -- Emma Miller to Program 2, Dominic Klyve
(237, 237, 4, 13), -- Liam Wilson to Program 4, Bruce Palmquist
(238, 238, 1, 9), -- Chloe Taylor to Program 1, Chris Stone
(239, 239, 2, 15), -- Julian Martinez to Program 2, Dominic Klyve
(240, 240, 4, 13), -- Daniel Lopez to Program 4, Bruce Palmquist
(241, 241, 1, 2), -- Isla Brown to Program 1, Judd Grey
(242, 242, 2, 15), -- Ella Garcia to Program 2, Dominic Klyve
(243, 243, 4, 13), -- Benjamin Smith to Program 4, Bruce Palmquist
(244, 244, 1, 3), -- Evelyn Garcia to Program 1, Eva Whitsett
(245, 245, 2, 15), -- Victoria Nguyen to Program 2, Dominic Klyve
(246, 246, 4, 13), -- Oliver Chen to Program 4, Bruce Palmquist
(247, 247, 1, 18), -- Ryan Tran to Program 1, Mike Pease
(248, 248, 2, 15), -- Grace Gupta to Program 2, Dominic Klyve
(249, 249, 4, 13), -- Sophia Singh to Program 4, Bruce Palmquist
(250, 250, 1, 9), -- Layla Shah to Program 1, Chris Stone
(251, 251, 2, 15), -- Luke Kim to Program 2, Dominic Klyve
(252, 252, 4, 13), -- Luna Patel to Program 4, Bruce Palmquist
(253, 253, 1, 2), -- Eleanor Johnson to Program 1, Judd Grey
(254, 254, 2, 15), -- Ella Davis to Program 2, Dominic Klyve
(255, 255, 4, 13), -- Michael Brown to Program 4, Bruce Palmquist
(256, 256, 1, 3), -- Aiden Miller to Program 1, Eva Whitsett
(257, 257, 2, 15), -- Olivia Wilson to Program 2, Dominic Klyve
(258, 258, 4, 13), -- Noah Taylor to Program 4, Bruce Palmquist
(259, 259, 1, 18), -- Zoey Martinez to Program 1, Mike Pease
(260, 260, 2, 15), -- Riley Lopez to Program 2, Dominic Klyve
(261, 261, 4, 13), -- Ella Brown to Program 4, Bruce Palmquist
(262, 262, 1, 9), -- Victoria Garcia to Program 1, Chris Stone
(263, 263, 2, 15), -- Zoe Smith to Program 2, Dominic Klyve
(264, 264, 4, 13), -- Julian Garcia to Program 4, Bruce Palmquist
(265, 265, 1, 2), -- Emily Nguyen to Program 1, Judd Grey
(266, 266, 2, 15), -- Grace Chen to Program 2, Dominic Klyve
(267, 267, 4, 13), -- Liam Tran to Program 4, Bruce Palmquist
(268, 268, 1, 3), -- Samantha Gupta to Program 1, Eva Whitsett
(269, 269, 2, 15), -- Benjamin Singh to Program 2, Dominic Klyve
(270, 270, 4, 13), -- Aria Shah to Program 4, Bruce Palmquist
(271, 271, 1, 18), -- Lily Kim to Program 1, Mike Pease
(272, 272, 2, 15), -- Ava Patel to Program 2, Dominic Klyve
(273, 273, 4, 13), -- Jackson Johnson to Program 4, Bruce Palmquist
(274, 274, 1, 9), -- Ella Davis to Program 1, Chris Stone
(275, 275, 2, 15), -- Scarlett Brown to Program 2, Dominic Klyve
(276, 276, 4, 13), -- Michael Miller to Program 4, Bruce Palmquist
(277, 277, 1, 2), -- Aiden Wilson to Program 1, Judd Grey
(278, 278, 2, 15), -- Lucas Taylor to Program 2, Dominic Klyve
(279, 279, 4, 13), -- Ella Martinez to Program 4, Bruce Palmquist
(280, 280, 1, 3), -- Chloe Lopez to Program 1, Eva Whitsett
(281, 281, 2, 15), -- James Brown to Program 2, Dominic Klyve
(282, 282, 4, 13), -- Victoria Garcia to Program 4, Bruce Palmquist
(283, 283, 1, 18), -- Luke Smith to Program 1, Mike Pease
(284, 284, 2, 15), -- Isla Garcia to Program 2, Dominic Klyve
(285, 285, 4, 13), -- Benjamin Nguyen to Program 4, Bruce Palmquist
(286, 286, 1, 9), -- Aria Chen to Program 1, Chris Stone
(287, 287, 2, 15), -- Sophie Tran to Program 2, Dominic Klyve
(288, 288, 4, 13), -- Aiden Gupta to Program 4, Bruce Palmquist
(289, 289, 1, 2), -- Victoria Singh to Program 1, Judd Grey
(290, 290, 2, 15), -- Zoe Shah to Program 2, Dominic Klyve
(291, 291, 4, 13), -- Luke Kim to Program 4, Bruce Palmquist
(292, 292, 1, 3), -- Scarlett Patel to Program 1, Eva Whitsett
(293, 293, 2, 15), -- Grace Johnson to Program 2, Dominic Klyve
(294, 294, 4, 13), -- Henry Davis to Program 4, Bruce Palmquist
(295, 295, 1, 18), -- Ava Brown to Program 1, Mike Pease
(296, 296, 2, 15), -- Michael Miller to Program 2, Dominic Klyve
(297, 297, 4, 13), -- Evelyn Wilson to Program 4, Bruce Palmquist
(298, 298, 1, 9), -- Lucas Taylor to Program 1, Chris Stone
(299, 299, 2, 15), -- Ella Martinez to Program 2, Dominic Klyve
(300, 300, 4, 13); -- Liam Lopez to Program 4, Bruce Palmquist

INSERT INTO gen_ed (name, requirement) VALUES 
--K1 classes
   ('ENG 104', 'K1'),
('ENTP 200', 'K1'),
('MGT 200', 'K1'),
('PHIL 153', 'K1'),
('ENG 103', 'K1'),
('PHIL 152', 'K1'),
('PHIL 151', 'K1'),
('ENG 102', 'K1'),
('ADMG 285', 'K1'),
('DHC 270', 'K1'),
('ENG 111', 'K1'),
('HIST 302', 'K1'),
--K2 classes
('ABS 210', 'K2'),
('ANTH 137', 'K2'),
('ART 333', 'K2'),
('COM 202', 'K2'),
('ECON 101', 'K2'),
('EFC 250', 'K2'),
('ENG 243', 'K2'),
('FR 200', 'K2'),
('GEOG 250', 'K2'),
('LAJ 102', 'K2'),
('LLAS 302', 'K2'),
('PHIL 107', 'K2'),
('POSC 210', 'K2'),
('PUBH 311', 'K2'),
('PUBH 351', 'K2'),
('RUSS 200', 'K2'),
('SOC 109', 'K2'),
('SOC 305', 'K2'),
('SUST 301', 'K2'),
('WGSS 201', 'K2'),
('WGSS 302', 'K2'),
('YESS 102', 'K2'),
('ENST 360', 'K2'),
('HIST 143', 'K2'),
('LAJ 210', 'K2'),
('AIS 103', 'K2'),
('EDBL 250', 'K2'),
('HIST 144', 'K2'),
('LIS 245', 'K2'),
('LLAS 102', 'K2'),
('LLAS 303', 'K2'),
('PSY 310', 'K2'),
('MKT 360', 'K2'),
('BUS 241', 'K2'),
('DHC 260', 'K2'),

--K3 classes 
('ART 103', 'K3'),
('EDLT 219', 'K3'),
('ENG 264', 'K3'),
('DNCE 161', 'K3'),
('ENG 265', 'K3'),
('FILM 150', 'K3'),
('FR 201', 'K3'),
('MUS 101', 'K3'),
('MUS 103', 'K3'),
('AST 301', 'K3'),
('CHIN 301', 'K3'),
('COM 250', 'K3'),
('DHC 150', 'K3'),
('MUS 102', 'K3'),
('TH 101', 'K3'),
('TH 107', 'K3'),

--K4 classes 
('ECON 102', 'K4'),
('GERM 200', 'K4'),
('IEM 330', 'K4'),
('ENST 310', 'K4'),
('GEOG 101', 'K4'),
('GEOL 303', 'K4'),
('HIST 101', 'K4'),
('IDS 343', 'K4'),
('PHIL 106', 'K4'),
('PUBH 317', 'K4'),
('ACCT 284', 'K4'),
('ANTH 130', 'K4'),
('AST 102', 'K4'),
('COM 302', 'K4'),
('ECON 202', 'K4'),
('EDLT 217', 'K4'),
('ENG 347', 'K4'),
('HIST 103', 'K4'),
('KRN 311', 'K4'),
('MGT 384', 'K4'),
('MUS 105', 'K4'),
('POSC 270', 'K4'),
('WGSS 340', 'K4'),
('WLC 311', 'K4'),
('RELS 103', 'K4'),
('DHC 261', 'K4'),

--K5 classes 
('ABS 110', 'K5'),
('ENG 106', 'K5'),
('LAJ 215', 'K5'),
('TH 382', 'K5'),
('WLC 250', 'K5'),
('ENG 107', 'K5'),
('HIST 102', 'K5'),
('MGT 395', 'K5'),
('PHIL 105', 'K5'),
('AIS 102', 'K5'),
('ENG 109', 'K5'),
('HIST 301', 'K5'),
('HUM 101', 'K5'),
('HUM 102', 'K5'),
('HUM 103', 'K5'),
('LLAS 388', 'K5'),
('PHIL 104', 'K5'),
('RELS 102', 'K5'),
('WLC 341', 'K5'),
('ENG 108', 'K5'),
('PHIL 103', 'K5'),
('POSC 280', 'K5'),
('DHC 140', 'K5'),
('ENG 105', 'K5'),
('PHIL 101', 'K5'),
('RELS 101', 'K5'),

--K6 classes
('ANTH 180', 'K6'),
('GEOG 273', 'K6'),
('IDS 357', 'K6'),
('LLAS 301', 'K6'),
('MGT 380', 'K6'),
('POSC 260', 'K6'),
('STP 201 & 202', 'K6'),
('STP 300', 'K6'),
('TH 377', 'K6'),
('YESS 101', 'K6'),
('ANTH 107', 'K6'),
('ASP 305', 'K6'),
('COM 222', 'K6'),
('CDFS 101', 'K6'),
('HED 101', 'K6'),
('HRM 381', 'K6'),
('POSC 101', 'K6'),
('PSY 101', 'K6'),
('PSY 205', 'K6'),
('PUBH 209', 'K6'),
('SOC 327', 'K6'),
('ATM 281', 'K6'),
('ECON 201', 'K6'),
('CDFS 234', 'K6'),
('CDFS 310', 'K6'),
('LAJ 202', 'K6'),
('LAJ 216', 'K6'),
('MGT 389', 'K6'),
('PSY 242', 'K6'),
('SOC 101', 'K6'),
('SOC 107', 'K6'),
('WGSS 250', 'K6'),
('GEOG 208', 'K6'),
('MGT 386', 'K6'),
('PSY 333', 'K6'),
('SOC 307', 'K6'),
('AIS 101', 'K6'),
('BUS 389', 'K6'),
('SCED 305', 'K6'),
('SOC 322', 'K6'),
('DHC 250', 'K6'),
('CDFS 237', 'K6'),
('MATH 120', 'K6'),

--K7 classes
('ANTH 314', 'K7'),
('BIOL 200', 'K7'),
('PHYS 106', 'K7'),
('SCED 101', 'K7'),
('BIOL 101', 'K7'),
('CHEM 113 & LAB', 'K7'),
('EXSC 154', 'K7'),
('PHYS 109', 'K7'),
('ENST 201', 'K7'),
('GEOG 107', 'K7'),
('GEOL 107', 'K7'),
('IEM 103', 'K7'),
('PHYS 101', 'K7'),
('SCED 102', 'K7'),
('STEP 101 & 102 & 103', 'K7'),
('CHEM 111 & LAB', 'K7'),
('CHEM 181 & LAB', 'K7'),
('DHC 180', 'K7'),
('PHYS 103', 'K7'),

--K8 classes 
('BIOL 204', 'K8'),
('BIOL 300', 'K8'),
('IT 202', 'K8'),
('SCED 103', 'K8'),
('ACCT 301', 'K8'),
('ANTH 120', 'K8'),
('BIOL 201', 'K8'),
('BIOL 205', 'K8'),
('CS 102', 'K8'),
('FIN 101', 'K8'),
('GEOL 302', 'K8'),
('IT 105', 'K8'),
('NUTR 101', 'K8'),
('SHM 102', 'K8'),
('CS 107', 'K8'),
('ENST 202', 'K8'),
('ETSC 101', 'K8'),
('GEOG 111', 'K8'),
('GEOL 108', 'K8'),
('IEM 302', 'K8'),
('MATH 210', 'K8'),
('PHYS 304', 'K8'),
('BIOL 302', 'K8'),
('EET 101', 'K8'),
('PUBH 320', 'K8'),
('CHEM 101', 'K8'),
('CS 105', 'K8'),
('DHC 280', 'K8'),
('IT 111', 'K8'), 

--Quantitative Reasoning classes 
('BUS 221', 'Quantitative Reasoning'),
('CS 109', 'Quantitative Reasoning'),
('ECON 130', 'Quantitative Reasoning'),
('FIN 174', 'Quantitative Reasoning'),
('IT 165', 'Quantitative Reasoning'),
('MATH 101', 'Quantitative Reasoning'),
('MATH 102', 'Quantitative Reasoning'),
('MATH 103', 'Quantitative Reasoning'),
('MATH 130', 'Quantitative Reasoning'),
('MATH 152', 'Quantitative Reasoning'),
('MATH 153', 'Quantitative Reasoning'),
('MATH 154', 'Quantitative Reasoning'),
('MATH 155', 'Quantitative Reasoning'),
('MATH 164', 'Quantitative Reasoning'),
('MATH 172', 'Quantitative Reasoning'),
('MATH 211', 'Quantitative Reasoning'),
('PHYS 111', 'Quantitative Reasoning'),   
('PHYS 181', 'Quantitative Reasoning'),
('PSY 362', 'Quantitative Reasoning'),
('SOC 326', 'Quantitative Reasoning'),

--Academic Writing classes
('DHC 102', 'Academic Writing I'),
('ENG 101', 'Academic Writing I'),
('ENG 101A & 101B', 'Academic Writing I'),
('PHIL 110', 'Academic Writing I'),
('PHIL 111', 'Academic Writing I'),

--First year experience 
('CWU 184', 'First Year Experience'),

--the different situations for tranfers, etc 
 ('not taken', 'K1'), 
('transferred', 'K1'),
('not taken', 'K2'), 
('transferred', 'K2'),
('not taken', 'K3'), 
('transferred', 'K3'),
('not taken', 'K4'), 
('transferred', 'K4'),
('not taken', 'K5'), 
('transferred', 'K5'),
('not taken', 'K6'), 
('transferred', 'K6'),
('not taken', 'K7'), 
('transferred', 'K7'),
 ('not taken', 'K8'), 
('transferred', 'K8'),
('not taken', 'Quantitative Reasoning'), 
('transferred', 'Quantitative Reasoning'),
('not taken', 'Academic Writing I'), 
('transferred', 'Academic Writing I'),
('not taken', 'First Year Experience'), 
('transferred', 'First Year Experience');

INSERT INTO classes (name, title, credits, fall, winter, spring, summer, active)
VALUES 
    ('K1', 'Academic Writing II', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K2', 'Community Culture & Citizenship', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K3', 'Creative Expression', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K4', 'Global Dynamics', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K5', 'Humanities', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K6', 'Individual & Society', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K7', 'Physical & Natural World', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K8', 'Science & Technology', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('QR', 'Quantitative Reasoning', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('AW I', 'Academic Writing I', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('FYE', 'First Year Experience', 4, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');

    ('K1', 'Academic Writing II', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K2', 'Community Culture & Citizenship', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K3', 'Creative Expression', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K4', 'Global Dynamics', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K5', 'Humanities', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K6', 'Individual & Society', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K7', 'Physical & Natural World', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('K8', 'Science & Technology', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('QR', 'Quantitative Reasoning', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('AW I', 'Academic Writing I', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
    ('FYE', 'First Year Experience', 5, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes');
