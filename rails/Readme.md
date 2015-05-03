## Usage

To start a new rails project run
docker run -it --rm -v `pwd`/foo:/foo metakungfu/rails rails_new foo [additional params]

Regarding the gems you are using, you might need to install other libraries.
You can customize the pre bundle process by adding additional libraries required by other
fancy gems you might want to use, as well as doing additional steps before bundling.
To do this, simple add those instructions in your rails app at: bin/pre_bundle
You can find an example here: `docker run -it --rm metakungfu/rails sh -c 'cat /usr/local/bin/pre_bundle'`

You can find the urls of the apk repositories used by running this command:
`docker run -it --rm metakungfu/base sh -c 'cat /etc/apk/repositories'`

## Note

- Anytime you'll add a gem, building the image will install building dependencies. A
tradeoff has been made here to keep the image lightweight.
- You *MUST* have a bin/ directory in your repo when using 
