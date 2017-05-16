class Binutils < Formula
  desc "FSF Binutils for native development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.28.tar.gz"
  sha256 "cd717966fc761d840d451dbd58d44e1e5b92949d2073d75b73fccb476d772fcf"

  # No --default-names option as it interferes with Homebrew builds.

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--program-prefix=g",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--disable-werror",
                          "--enable-interwork",
                          "--enable-multilib",
                          "--enable-64-bit-bfd",
                          "--enable-targets=all"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "main", shell_output("#{bin}/gnm #{bin}/gnm")
  end
end
