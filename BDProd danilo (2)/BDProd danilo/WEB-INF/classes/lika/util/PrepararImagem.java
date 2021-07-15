package lika.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Transparency;
import java.awt.color.ColorSpace;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.ComponentColorModel;
import java.awt.image.DataBuffer;
import java.awt.image.DataBufferByte;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Blob;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.hibernate.Hibernate;

public class PrepararImagem {

	public static BufferedImage ImageToBuffered(Image im) {

		BufferedImage bi = new BufferedImage(im.getWidth(null), im
				.getHeight(null), BufferedImage.TYPE_INT_RGB);
		Graphics bg = bi.getGraphics();
		bg.drawImage(im, 0, 0, null);
		bg.dispose();

		return bi;

	}

	// Transforma um BufferedImage pra um array de bytes
	public static byte[] bufferToBytes(BufferedImage buffer, String formatName) {

		byte[] bytes = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		

		try {

			if (buffer != null) {
				ImageIO.write(buffer, formatName, baos);
			}
		} catch (IOException e) {

			baos = null;
			throw new RuntimeException(e.getMessage());

		} finally {

			if (baos != null) {
				bytes = baos.toByteArray();
			}
		}

		return bytes;

	}

	public Blob getBlob(byte[] image) {

		return Hibernate.createBlob(image);

	}

	public Blob getBlob(Image image) {

		return getBlob(bufferToBytes(ImageToBuffered(image), "png"));
	}

	public byte[] getBytes(Image image) {
		return bufferToBytes(ImageToBuffered(image), "png");
	}

	public ImageIcon getImagem(Blob blob) {

		try {

			byte[] b = blob.getBytes(1, (int) blob.length());
			ImageIcon icon = new ImageIcon(b);

			return icon;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static BufferedImage toImage(int w, int h, byte[] data) {
		DataBuffer buffer = new DataBufferByte(data, w * h);

		int pixelStride = 4; // assuming r, g, b, skip, r, g, b, skip...
		int scanlineStride = 4 * w; // no extra padding
		int[] bandOffsets = { 0, 1, 2 }; // r, g, b
		WritableRaster raster = Raster.createInterleavedRaster(buffer, w, h,
				scanlineStride, pixelStride, bandOffsets, null);

		ColorSpace colorSpace = ColorSpace.getInstance(ColorSpace.CS_sRGB);
		boolean hasAlpha = false;
		boolean isAlphaPremultiplied = false;
		int transparency = Transparency.OPAQUE;
		int transferType = DataBuffer.TYPE_BYTE;
		ColorModel colorModel = new ComponentColorModel(colorSpace, hasAlpha,
				isAlphaPremultiplied, transparency, transferType);

		return new BufferedImage(colorModel, raster, isAlphaPremultiplied, null);
	}

}
