��U S E   [ m a s t e r ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     D a t a b a s e   [ K r a m s e _ S t a g i n g ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 C R E A T E   D A T A B A S E   [ K r a m s e _ S t a g i n g ] 
 
   C O N T A I N M E N T   =   N O N E 
 
   O N     P R I M A R Y   
 
 (   N A M E   =   N ' K r a m s e _ S t a g i n g ' ,   F I L E N A M E   =   N ' C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ M S S Q L 1 5 . M S S Q L D E V 2 0 1 9 \ M S S Q L \ D A T A \ K r a m s e _ S t a g i n g . m d f '   ,   S I Z E   =   7 3 7 2 8 K B   ,   M A X S I Z E   =   U N L I M I T E D ,   F I L E G R O W T H   =   6 5 5 3 6 K B   ) 
 
   L O G   O N   
 
 (   N A M E   =   N ' K r a m s e _ S t a g i n g _ l o g ' ,   F I L E N A M E   =   N ' C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ M S S Q L 1 5 . M S S Q L D E V 2 0 1 9 \ M S S Q L \ D A T A \ K r a m s e _ S t a g i n g _ l o g . l d f '   ,   S I Z E   =   8 1 9 2 K B   ,   M A X S I Z E   =   2 0 4 8 G B   ,   F I L E G R O W T H   =   6 5 5 3 6 K B   ) 
 
   W I T H   C A T A L O G _ C O L L A T I O N   =   D A T A B A S E _ D E F A U L T 
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   C O M P A T I B I L I T Y _ L E V E L   =   1 5 0 
 
 G O 
 
 I F   ( 1   =   F U L L T E X T S E R V I C E P R O P E R T Y ( ' I s F u l l T e x t I n s t a l l e d ' ) ) 
 
 b e g i n 
 
 E X E C   [ K r a m s e _ S t a g i n g ] . [ d b o ] . [ s p _ f u l l t e x t _ d a t a b a s e ]   @ a c t i o n   =   ' e n a b l e ' 
 
 e n d 
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A N S I _ N U L L _ D E F A U L T   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A N S I _ N U L L S   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A N S I _ P A D D I N G   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A N S I _ W A R N I N G S   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A R I T H A B O R T   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A U T O _ C L O S E   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A U T O _ S H R I N K   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A U T O _ U P D A T E _ S T A T I S T I C S   O N   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   C U R S O R _ C L O S E _ O N _ C O M M I T   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   C U R S O R _ D E F A U L T     G L O B A L   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   C O N C A T _ N U L L _ Y I E L D S _ N U L L   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   N U M E R I C _ R O U N D A B O R T   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   Q U O T E D _ I D E N T I F I E R   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   R E C U R S I V E _ T R I G G E R S   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T     D I S A B L E _ B R O K E R   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A U T O _ U P D A T E _ S T A T I S T I C S _ A S Y N C   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   D A T E _ C O R R E L A T I O N _ O P T I M I Z A T I O N   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   T R U S T W O R T H Y   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A L L O W _ S N A P S H O T _ I S O L A T I O N   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   P A R A M E T E R I Z A T I O N   S I M P L E   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   R E A D _ C O M M I T T E D _ S N A P S H O T   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   H O N O R _ B R O K E R _ P R I O R I T Y   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   R E C O V E R Y   F U L L   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T     M U L T I _ U S E R   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   P A G E _ V E R I F Y   C H E C K S U M     
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   D B _ C H A I N I N G   O F F   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   F I L E S T R E A M (   N O N _ T R A N S A C T E D _ A C C E S S   =   O F F   )   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   T A R G E T _ R E C O V E R Y _ T I M E   =   6 0   S E C O N D S   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   D E L A Y E D _ D U R A B I L I T Y   =   D I S A B L E D   
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   A C C E L E R A T E D _ D A T A B A S E _ R E C O V E R Y   =   O F F     
 
 G O 
 
 E X E C   s y s . s p _ d b _ v a r d e c i m a l _ s t o r a g e _ f o r m a t   N ' K r a m s e _ S t a g i n g ' ,   N ' O N ' 
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T   Q U E R Y _ S T O R E   =   O F F 
 
 G O 
 
 U S E   [ K r a m s e _ S t a g i n g ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ C o n s i g n o r ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ C o n s i g n o r ] ( 
 
 	 [ C o n s i g n o r _ I d ]   [ i n t ]   N O T   N U L L , 
 
 	 [ C o n s i g n o r ]   [ n v a r c h a r ] ( 2 5 0 )   N U L L , 
 
 	 [ D i s c o u n t ]   [ f l o a t ]   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ C o n s i g n o r ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ C o n s i g n o r _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ C o n t a i n e r ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ C o n t a i n e r ] ( 
 
 	 [ C o n t a i n e r _ I d ]   [ i n t ]   N O T   N U L L , 
 
 	 [ T y p e ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L , 
 
 	 [ R e f r i g e r a t i o n ]   [ b i t ]   N U L L , 
 
 	 [ C u b e s ]   [ f l o a t ]   N U L L , 
 
 	 [ E u r o P r i c e P e r K m ]   [ f l o a t ]   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ C o n t a i n e r ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ C o n t a i n e r _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ I t e m ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ I t e m ] ( 
 
 	 [ I t e m _ I d ]   [ i n t ]   N O T   N U L L , 
 
 	 [ M f g r ]   [ n v a r c h a r ] ( 5 0 )   N U L L , 
 
 	 [ S t o r a g e T y p e ]   [ n v a r c h a r ] ( 5 0 )   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ I t e m ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ I t e m _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ P o r t ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ P o r t ] ( 
 
 	 [ P o r t _ I d ]   [ i n t ]   N O T   N U L L , 
 
 	 [ P o r t N a m e ]   [ n v a r c h a r ] ( 5 0 )   N U L L , 
 
 	 [ C o u n t r y ]   [ n v a r c h a r ] ( 5 0 )   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ P o r t ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ P o r t _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ S h i p ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ S h i p ] ( 
 
 	 [ S h i p _ I d ]   [ i n t ]   N O T   N U L L , 
 
 	 [ S h i p n a m e ]   [ n v a r c h a r ] ( 2 5 5 )   N U L L , 
 
 	 [ M a x T E U ]   [ i n t ]   N U L L , 
 
 	 [ Y e a r c o s t ]   [ n u m e r i c ] ( 3 8 ,   1 9 )   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ S h i p ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ S h i p _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ] ( 
 
 	 [ W a i t i n g _ T i m e _ I d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L , 
 
 	 [ P o r t _ I d ]   [ i n t ]   N U L L , 
 
 	 [ S h i p _ I d ]   [ i n t ]   N U L L , 
 
 	 [ W a i t i n g _ T i m e ]   [ n v a r c h a r ] ( 1 0 )   N U L L , 
 
 	 [ V o y a g e _ I d ]   [ i n t ]   N U L L , 
 
   C O N S T R A I N T   [ P K _ D i m _ W a i t i n g _ T i m e ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ W a i t i n g _ T i m e _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ F _ S h i p m e n t ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ F _ S h i p m e n t ] ( 
 
 	 [ I d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L , 
 
 	 [ S h i p m e n t _ I d ]   [ i n t ]   N U L L , 
 
 	 [ I t e m _ I d ]   [ i n t ]   N U L L , 
 
 	 [ C o n s i g n o r _ I d ]   [ i n t ]   N U L L , 
 
 	 [ V o y a g e _ i d ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ F r o m ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ T o ]   [ i n t ]   N U L L , 
 
 	 [ D i s t a n c e ]   [ i n t ]   N U L L , 
 
 	 [ C o n t a i n e r _ I d ]   [ i n t ]   N U L L , 
 
 	 [ C o n t a i n e r _ R a n g e ]   [ n v a r c h a r ] ( 5 0 )   N U L L , 
 
 	 [ N u m b e r _ C o n t a i n e r s ]   [ i n t ]   N U L L , 
 
   C O N S T R A I N T   [ P K _ F _ S h i p m e n t _ 1 ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ F _ V o y a g e _ P o r t ]         S c r i p t   D a t e :   2 8 - 3 - 2 0 2 3   1 0 : 2 9 : 4 1   * * * * * * / 
 
 S E T   A N S I _ N U L L S   O N 
 
 G O 
 
 S E T   Q U O T E D _ I D E N T I F I E R   O N 
 
 G O 
 
 C R E A T E   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ] ( 
 
 	 [ V o y a g e _ P o r t _ I d ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L , 
 
 	 [ V o y a g e _ I d ]   [ i n t ]   N U L L , 
 
 	 [ S h i p _ I d ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ C u r r e n t ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ N e x t ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ S t a r t ]   [ i n t ]   N U L L , 
 
 	 [ P o r t _ I d _ E n d ]   [ i n t ]   N U L L , 
 
 	 [ D a t e _ D e p a r t ]   [ d a t e t i m e ]   N U L L , 
 
 	 [ L e g _ D a t e _ D e p a r t ]   [ d a t e t i m e ]   N U L L , 
 
 	 [ L e g _ D a t e _ A r r i v a l ]   [ d a t e t i m e ]   N U L L , 
 
 	 [ W a i t i n g _ T i m e _ I d ]   [ i n t ]   N U L L , 
 
   C O N S T R A I N T   [ P K _ F _ V o y a g e _ P o r t ]   P R I M A R Y   K E Y   C L U S T E R E D   
 
 ( 
 
 	 [ V o y a g e _ P o r t _ I d ]   A S C 
 
 ) W I T H   ( P A D _ I N D E X   =   O F F ,   S T A T I S T I C S _ N O R E C O M P U T E   =   O F F ,   I G N O R E _ D U P _ K E Y   =   O F F ,   A L L O W _ R O W _ L O C K S   =   O N ,   A L L O W _ P A G E _ L O C K S   =   O N ,   O P T I M I Z E _ F O R _ S E Q U E N T I A L _ K E Y   =   O F F )   O N   [ P R I M A R Y ] 
 
 )   O N   [ P R I M A R Y ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ D i m _ W a i t i n g _ T i m e _ D i m _ P o r t ]   F O R E I G N   K E Y ( [ P o r t _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]   C H E C K   C O N S T R A I N T   [ F K _ D i m _ W a i t i n g _ T i m e _ D i m _ P o r t ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ D i m _ W a i t i n g _ T i m e _ D i m _ S h i p ]   F O R E I G N   K E Y ( [ S h i p _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ S h i p ]   ( [ S h i p _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]   C H E C K   C O N S T R A I N T   [ F K _ D i m _ W a i t i n g _ T i m e _ D i m _ S h i p ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ C o n s i g n o r ]   F O R E I G N   K E Y ( [ C o n s i g n o r _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ C o n s i g n o r ]   ( [ C o n s i g n o r _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ C o n s i g n o r ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ C o n t a i n e r ]   F O R E I G N   K E Y ( [ C o n t a i n e r _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ C o n t a i n e r ]   ( [ C o n t a i n e r _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ C o n t a i n e r ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ I t e m ]   F O R E I G N   K E Y ( [ I t e m _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ I t e m ]   ( [ I t e m _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ I t e m ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ P o r t ]   F O R E I G N   K E Y ( [ P o r t _ I d _ F r o m ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ P o r t ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ P o r t 1 ]   F O R E I G N   K E Y ( [ P o r t _ I d _ T o ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ S h i p m e n t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ S h i p m e n t _ D i m _ P o r t 1 ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t ]   F O R E I G N   K E Y ( [ P o r t _ I d _ C u r r e n t ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 1 ]   F O R E I G N   K E Y ( [ P o r t _ I d _ N e x t ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 1 ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 2 ]   F O R E I G N   K E Y ( [ P o r t _ I d _ S t a r t ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 2 ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 3 ]   F O R E I G N   K E Y ( [ P o r t _ I d _ E n d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ P o r t ]   ( [ P o r t _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ P o r t 3 ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ S h i p ]   F O R E I G N   K E Y ( [ S h i p _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ S h i p ]   ( [ S h i p _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ S h i p ] 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]     W I T H   C H E C K   A D D     C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ W a i t i n g _ T i m e ]   F O R E I G N   K E Y ( [ W a i t i n g _ T i m e _ I d ] ) 
 
 R E F E R E N C E S   [ d b o ] . [ D i m _ W a i t i n g _ T i m e ]   ( [ W a i t i n g _ T i m e _ I d ] ) 
 
 G O 
 
 A L T E R   T A B L E   [ d b o ] . [ F _ V o y a g e _ P o r t ]   C H E C K   C O N S T R A I N T   [ F K _ F _ V o y a g e _ P o r t _ D i m _ W a i t i n g _ T i m e ] 
 
 G O 
 
 U S E   [ m a s t e r ] 
 
 G O 
 
 A L T E R   D A T A B A S E   [ K r a m s e _ S t a g i n g ]   S E T     R E A D _ W R I T E   
 
 G O 
 
 