# Upstream project has requested we use a mirror as the main URL
# https://github.com/Homebrew/homebrew/pull/21419
class Xz < Formula
  desc "General-purpose data compression with high compression ratio"
  homepage "https://tukaani.org/xz/"
  url "https://fossies.org/linux/misc/xz-5.2.3.tar.gz"
  mirror "https://tukaani.org/xz/xz-5.2.3.tar.gz"
  #sha256 "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb"
  #sha256 "cc165ec3f52ba8d957a678924ec03e2a90c434fd706a98716097fc76765ca8c0"
  sha256 "0ebe9892dbeb17439cfcdf86cb4470a6ede74adeea44381324171680fd1be928"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check"
    system "make", "install"
  end

  test do
    path = testpath/"data.txt"
    original_contents = "." * 1000
    path.write original_contents

    # compress: data.txt -> data.txt.xz
    system bin/"xz", path
    assert !path.exist?

    # decompress: data.txt.xz -> data.txt
    system bin/"xz", "-d", "#{path}.xz"
    assert_equal original_contents, path.read
  end
end
