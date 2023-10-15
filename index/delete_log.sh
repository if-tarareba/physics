
#!/bin/bash
# LatexWorkshopがログファイルたちを消してくれないので作成

# outディレクトリ内のPDFじゃないファイルは全部消す
find ./out/ -type f | grep -v -E -e '.pdf$' -e '.synctex.gz$' | xargs rm -rf
