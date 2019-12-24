/**
 * 
 */
package com.nemew.blog.post.controller;
import java.io.File;
import java.io.IOException;
import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import com.drew.metadata.exif.ExifIFD0Directory;

/**
  * @FileName : ImageUtil.java
  * @Project : MavenTest
  * @Date : 2019. 12. 24. 
  * @작성자 : song
  * @변경이력 :
  * @프로그램 설명 : 모바일에서 사진 업로드후 조회 시 사진설정땜에 이미지가 가로로 출력되는 이슈를 해결하기 위해 긁어옴
  */



public class ImageUtil {

	

	/**

	 * Gets the orientation of an image (usually photo).

	 * Outputs:

	 * 6: rotate 90,

	 * 1: original (no change)

	 * 3: rotate 180,

	 * 8: rotate 270,

	 * others: original (no change)

	 * 

	 * @param in a File object to check

	 * @return orientation value

	 * @throws IOException

	 */
	
	//송현주 : 수정을 좀 했는디... 이미지 url을 String으로 불러오도록 변경
	public static int getOrientation(String result) throws IOException {
		
		File in = new File(result);
		
		int orientation = 1;

		Metadata metadata;

		Directory directory;

		try {

			metadata = ImageMetadataReader.readMetadata(in);

			directory = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);

			

			if(directory != null){

				orientation = directory.getInt(ExifIFD0Directory.TAG_ORIENTATION);

			}

		} catch (ImageProcessingException e) {

			System.err.println("[ImgUtil] could not process image");

			e.printStackTrace();

		} catch (MetadataException e) {

			System.err.println("[ImgUtil] could not get orientation from image");

			e.printStackTrace();

		}

		

		return orientation;

	}

	

	public static int getDegreeForOrientation(int orientation){

		int degree = 0;

		

		switch(orientation){

		case 6:

			degree = 90; break;

		case 1:

			degree = 0; break;

		case 3:

			degree = 180; break;

		case 8:

			degree = 270; break;

		default:

			degree = 0; break;

		}

		return degree;

	}

}


