class Sifs < Formula
  desc "SIFS Is Fast Search: instant local code search for agents"
  homepage "https://github.com/tristanmanchester/sifs"
  url "https://crates.io/api/v1/crates/sifs/0.3.4/download"
  sha256 "c19fd785611e1009dd787d6e2bc8c9d5aead2f044aef72e01f3079b9482a4520"
  version "0.3.4"
  license "MIT"
  head "https://github.com/tristanmanchester/sifs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  test do
    repo = testpath/"tiny-repo"
    repo.mkpath
    (repo/"auth.py").write <<~PY
      def authenticate_token(token):
          return token == "secret"
    PY

    system "git", "-C", repo, "init", "--quiet"

    output = shell_output("#{bin}/sifs search authenticate_token --source #{repo} --mode bm25 --offline --no-cache")
    assert_match "auth.py", output
    assert_match "authenticate_token", output
  end
end
