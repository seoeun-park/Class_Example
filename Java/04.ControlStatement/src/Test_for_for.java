public class Test_for_for {
	public static void main(String[] args) {
		/*
		 * 	¡Ú ¡Ú ¡Ú ¡Ú ¡Ú
		 * 	¡Ú ¡Ú ¡Ú ¡Ú 
		 * 	¡Ú ¡Ú ¡Ú 
		 * 	¡Ú ¡Ú 
		 * 	¡Ú 
		 *         	
		 */
		
		for (int i = 1; i <= 5; i++) {
			for (int j = 5; j >= i; j--) {
				System.out.print("¡Ú");
			}
			System.out.println();
		}
		
		System.out.println("=================");
		
		for (int i = 5; i >= 1; i--) {
			for (int j = 1; j <= i; j++) {
				System.out.print("¡Ú");
			}
			System.out.println();
		}
		
		System.out.println("=================");
		
		for (int i = 1; i <= 5; i++) {
			for (int j = 5; j >= 1; j--) {
				if (j > i) {
					System.out.print("\t");
				} else { 
					System.out.print("¡Ú");
				}
			}
			System.out.println();
		}
		
	} //main()
} //class
