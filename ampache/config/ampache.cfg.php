;#<?php exit(); ?>##
;#########################################################
; General Config                                         #
;#########################################################

; This value is used to detect if this config file is up to date
; this is compared against a constant called CONFIG_VERSION
; that is located in src/Config/Init/InitializationHandlerConfig.php
config_version = 67

;#########################################################
; Auto Update                                            #
;#########################################################

; Allow you to hard code a default git branch for Ampache
; If you set this value the inbuilt updater will use this branch for updates.
; POSSIBLE VALUES: master develop
; DEFAULT: none
;github_force_branch = "develop"

; This value allows to override the composer binary path to distinguish between multiple composer versions
; Either a binary name in $PATH as well as a fully qualified path is possible
; DEFAULT: composer
;composer_binary_path = "composer"

; We sometimes need to talk and will show a warning to admin users
; Enable this setting if you don't want to see warnings (When we enable them)
; DEFAULT: "false"
;hide_ampache_messages = "true"

;#########################################################
; Path Vars                                              #
;#########################################################

; The public http host of your server.
; If not set, retrieved automatically from client request.
; This setting is required for WebSocket server
; DEFAULT: none
http_host = "{{cfg.ampache.host}}"

; The public http port of your server.
; If not set, retrieved automatically from client request.
; DEFAULT: none
http_port = {{cfg.ampache.port}}

; The public path to your Ampache install
; Do not put a trailing / on this path
; For example if your site is located at http://localhost
; than you do not need to enter anything for the web_path
; if it is located at http://localhost/music you need to
; set web_path to /music
; DEFAULT: none
;web_path = ""

; The local http url of your server.
; This is used to access the server from within the
; same host where ampache is running.
; For example, if the ampache server is not
; directly accessed via the public domain but via a reverse
; proxy, local_web_path would need to be changed
; to a localhost URL.
; If not set, retrieved automatically from server information.
; DEFAULT: none
local_web_path = "http://{{cfg.bind.address}}:{{cfg.bind.port}}"

; The Ampache base URL is determinied from web requests.
; When using CLI actions you don't send a web request meaning
; it can't be determined. This setting allows you to set a
; fallback when the base url can't be determined. Do not put a
; trailing slash or this will not work.
; DEFAULT: none
;fallback_url = "https://example.ampache.dev"

;#########################################################
; Database                                               #
;#########################################################

; Hostname of your database
; For socket authentication, set the path to socket file (e.g. /var/run/mysqld/mysqld.sock)
; DEFAULT: localhost
database_hostname = {{cfg.ampache.database.hostname}}

; Port to use when connecting to your database
; DEFAULT: none
database_port = {{cfg.ampache.database.port}}

; Name of your Ampache database
; DEFAULT: none
database_name = {{cfg.ampache.database.name}}

; Username for your Ampache database
; DEFAULT: none
database_username = {{cfg.ampache.database.username}}

; Password for your Ampache database, this can not be blank
; this is a 'forced' security precaution, the default value
; will not work (except if using socket authentication)
; DEFAULT: none
database_password = {{cfg.ampache.database.password}}

; Set a default charset for your database
; Don't change this unless you understand how to BACKUP and RESTORE a database!
;
; DEFAULT: "utf8mb4"
;database_charset = "utf8mb4"

; Set a default collation for your database
; Don't change this unless you understand how to BACKUP and RESTORE a database!
;
; There are a ton of options but you'll probably want one of these.
; "utf8_unicode_ci" = Regular unicode (3 bytes per character)
; "utf8mb4_unicode_ci" = 4 bytes per character
; "utf8mb4_unicode_520_ci" = Supports more characters and is based on UCA 5.2.0 weight keys
;   http://www.unicode.org/Public/UCA/5.2.0/allkeys.txt
; DEFAULT: "utf8mb4_unicode_ci"
;database_collation = "utf8mb4_unicode_ci"

;#########################################################
; Session and Security                                   #
;#########################################################

; Cryptographic secret
; This MUST BE changed with your own secret key. Ampache-specific, just pick any random string you want.
secret_key = "{{cfg.ampache.session.secret_key}}"

; Length that a session will last expressed in seconds. Default is
; one hour.
; DEFAULT: 3600
session_length = 3600

; Length that the session for a single streaming instance will last
; the default is two hours. With some clients, and long songs this can
; cause playback to stop, increase this value if you experience that
; DEFAULT: 7200
stream_length = 7200

; This length defines how long a 'remember me' session and cookie will
; last, the default is 86400, same as length. It is up to the administrator
; of the box to increase this, for reference 86400 = 1 day,
; 604800 = 1 week, and 2419200 = 1 month
; DEFAULT: 604800
remember_length = {{cfg.ampache.session.remember_length}}

; Name of the Session/Cookie that will sent to the browser
; default should be fine
; DEFAULT: ampache
session_name = ampache

; Lifetime of the Cookie, 0 == Forever (until browser close) , otherwise in terms of seconds
; If you want cookies to last past a browser close set this to a value in seconds.
; DEFAULT: 0
session_cookielife = 0

; Is the cookie a "secure" cookie? This should only be set to 1 (true) if you are
; running a secure site (HTTPS).
; DEFAULT: 0
{{#if cfg.ampache.session.cookie_secure ~}}
session_cookiesecure = 1
{{else ~}}
session_cookiesecure = 0
{{/if ~}}

; Auth Methods
; This defines which auth methods Auth will attempt to use and in which order.
; If auto_create isn't enabled the user must exist locally.
; DEFAULT: mysql
; VALUES: mysql,ldap,http,pam,external,openid
auth_methods = "mysql"

; External authentication
; This sets the helper used for external authentication.  It should conform to
; the interface used by mod_authnz_external
; DEFAULT: none
;external_authenticator = "/usr/sbin/pwauth"

; Automatic local password updating
; Determines whether successful authentication against an external source
; will result in an update to the password stored in the database.
; A locally stored password is needed for API access.
; DEFAULT: "false"
;auth_password_save = "true"

; Log out redirection target
; Defaults to our own login.php, but we can override it here if, for instance,
; we want to redirect to an SSO provider instead.
;logout_redirect = "http://sso.example.com/logout"

; Use Access List
; Toggle this on if you want Ampache to pay attention to the access list
; and only allow streaming/downloading/api-rpc from known hosts api-rpc
; will not work without this on.
; NOTE: Default Behavior is DENY FROM ALL
; DEFAULT: "true"
access_control = "true"

; Require Session
; If this is set to true Ampache will make sure that the URL passed when
; attempting to retrieve a song contains a valid Session ID This prevents
; others from guessing URL's. This setting is ignored if you have use_auth
; disabled.
; DEFAULT: "true"
require_session = "true"

; Require LocalNet Session
; If this is set to true then Ampache will require that a valid session
; is passed even on hosts defined in the Local Network ACL. This setting
; has no effect if access_control is not enabled
; DEFAULT: "true"
require_localnet_session = "true"

; Multiple Logins
; Added by Vlet 07/25/07
; When this setting is enabled a user may only be logged in from a single
; IP address at any one time, this is to prevent sharing of accounts
; DEFAULT: "false"
;prevent_multiple_logins = "true"

; Allow Embedding Ampache in Frames
; Whether a browser should be allowed to render a page in a <frame>, <iframe>, <embed> or <object>.
; This is used to avoid click-jacking attacks, by ensuring that their content is not embedded into other sites.
; By default Ampache pages can only be displayed in a frame on the same origin as the page itself.
; DEFAULT: "false"
;disable_xframe_sameorigin = "true"

;#########################################################
; Metadata                                               #
;#########################################################

; This determines the tag order for all cataloged
; music. If none of the listed tags are found then
; Ampache will randomly use whatever was found.
; POSSIBLE VALUES: ape asf avi id3v1 id3v2 lyrics3 matroska mpeg quicktime riff
;     vorbiscomment
; DEFAULT: vorbiscomment id3v2 id3v1 quicktime matroska ape asf avi mpeg riff
getid3_tag_order = "vorbiscomment,id3v2,id3v1,quicktime,matroska,ape,asf,avi,mpeg,riff"

; This determines whether we try to autodetect the encoding for id3v2 tags.
; May break valid tags.
; DEFAULT: "false"
;getid3_detect_id3v2_encoding = "true"

; This determines if we write the changes to files (as id3 tags) when modifying metadata, or only keep them in Ampache (the default).
; DEFAULT: "false"
;write_id3 = "true"

; This determines if we write the changes to files (as id3 tags) when modifying album art, or only keep them in Ampache (the default)
; as id3 metadata when updated.
; DEFAULT: "false"
;write_id3_art = "true"

; This determines the order in which metadata sources are used (and in the
; case of plugins, checked)
; POSSIBLE VALUES (builtins): filename and getID3
; POSSIBLE VALUES (plugins): MusicBrainz,TheAudioDb, plus any others you've installed.
; DEFAULT: getID3 filename
metadata_order = "getID3,MusicBrainz,TheAudioDb,filename"

; This determines the order in which metadata sources are used (and in the
; case of plugins, checked) for video files
; POSSIBLE VALUES (builtins): filename and getID3
; POSSIBLE VALUES (plugins): Tvdb,Tmdb,Omdb, plus any others you've installed.
; DEFAULT: "filename,getID3"
metadata_order_video = "filename,getID3"

; This determines if extended metadata grabbed from external services should be deferred.
; If enabled, extended metadata is retrieved when browsing the library item.
; If disabled, extended metadata is retrieved at catalog update.
; Today, only Artist information (summary, place formed, ...) can be deferred.
; DEFAULT: "true"
deferred_ext_metadata = "true"

; Some taggers use delimiters other than \0 for fields
; This list specifies possible delimiters additional to \0
; This setting takes a regex pattern. TODO: explain that this is not just for genres until we can replace this safely
; DEFAULT: "[/]{2}|[/\\|,;]" (Split on "//", "_", "/", "\", "|", "," and ";")
additional_genre_delimiters = "[/]{2}|[_/\\|,;]"

; Enable importing custom metadata from files.
; This will need a bit of time during the import. So you may want to disable this
; if you have troubles with huge databases.
; DEFAULT: "false"
;enable_custom_metadata = "true"

;#########################################################
; File Tags                                             #
;#########################################################

; This determines if we write metadata to files when modifying metadata, or only keep them in Ampache (the default).
; DEFAULT: "false"
;write_tags = "true"

;#########################################################
; Catalog                                                #
;#########################################################

; File Pattern
; This defines which file types Ampache will attempt to catalog
; You can specify any file extension you want in here separating them with a |
; DEFAULT: mp3|mpc|m4p|m4a|aac|ogg|oga|wav|aif|aiff|rm|wma|asf|flac|opus|spx|ra|ape|shn|wv
catalog_file_pattern = "mp3|mpc|m4p|m4a|aac|ogg|oga|wav|aif|aiff|rm|wma|asf|flac|opus|spx|ra|ape|shn|wv"

; Video Pattern
; This defines which video file types Ampache will attempt to catalog
; You can specify any file extension you want in here separating them with
; a | but Ampache may not be able to parse them
; DEAFULT: avi|mpg|mpeg|flv|m4v|mp4|webm|mkv|wmv|ogv|mov|divx|m2ts
catalog_video_pattern = "avi|mpg|mpeg|flv|m4v|mp4|webm|mkv|wmv|ogv|mov|divx|m2ts"

; Playlist Pattern
; This defines which playlist types Ampache will attempt to catalog
; You can specify any file extension you want in here separating them with
; a | but Ampache may not be able to parse them
; DEFAULT: m3u|m3u8|pls|asx|xspf
catalog_playlist_pattern = "m3u|m3u8|pls|asx|xspf"

; Prefix Pattern
; This defines which prefix Ampache will ignore when importing tags from
; your music. You may add any prefix you want separating them with a |
; DEFAULT: The|An|A|Die|Das|Ein|Eine|Les|Le|La
catalog_prefix_pattern = "The|An|A|Die|Das|Ein|Eine|Les|Le|La"

; Ignore Pattern
; Ignore files that match this pattern
; You can specify any file extension you want in here separating them with a |
; DEFAULT: None
; catalog_ignore_pattern = "\(HTOA\)"

; Catalog disable
; This defines if catalog can be disabled without removing database entries
; WARNING: this increase sensibly sql requests and slow down Ampache a lot
; DEFAULT: "false"
;catalog_disable = "true"

; Catalog filter
; This defines if catalog can be filtered per user.
; The filters are set in the catalog management pages.
; WARNING: this increase sensibly sql requests and slow down Ampache a lot
; DEFAULT: "false"
;catalog_filter = "true"

; Delete from disk
; This determines if catalog manager users can delete media from disk.
; DEFAULT: "false"
;delete_from_disk = "true"

; Catalog verify by time
; Only verify the files that have been modified since the last verify.
; For large catalogs the verify process can be terribly long so this will help
; speed things up by checking modification date using filemtime() before loading
; DEFAULT: "false"
;catalog_verify_by_time = "true"

;#########################################################
; Program Settings                                       #
;#########################################################

; Downsample Remote
; If this is set to true and access control is on any users who are not
; coming from a defined 'network' ACL will be automatically downsampled
; regardless of their preferences. Requires access_control to be enabled
; DEFAULT: "false"
;downsample_remote = "true"

; Track User IPs
; If this is enabled Ampache will log the IP of every completed login
; it will store user, ip and time at one row per login. The results are
; displayed in Admin --> Users
; DEFAULT: "false"
;track_user_ip = "true"

; User IP Cardinality
; This defines how many days worth of IP history Ampache will track
; As it is one row per login on high volume sites you will want to
; clear it every now and then.
; DEFAULT: 42 days
;user_ip_cardinality = "42"

; Display this message on the Login page
; DEFAULT: ""
;login_message = "For the Love of Music"

; Allow Zip Download
; This setting allows/disallows using zlib to zip up an entire
; playlist/album for download. Even if this is turned on you will
; still need to enabled downloading for the specific user you
; want to be able to use this function
; DEFAULT: "false"
allow_zip_download = "{{cfg.ampache.features.zip_download}}"

; Allow Zip Types
; This setting allows/disallows zip download of specific object types
; If empty, all supported object types can be zipped.
; Otherwise, only the given object list can be zipped.
; POSSIBLE VALUES: artist, album, album_disk, playlist, search, tmp_playlist
; DEFAULT: none
;allow_zip_types = "album, album_disk"

; Art Zip Add
; This settings allows/disallows to include Album Art to the Zip
; If 'album_art_preferred_filename' exists this is included
; DEFAULT: "false"
;art_zip_add = "true"

; File Zip Comment
; This is an optional configuration option that adds a comment
; to your zip files, this only applies if you've got allow_zip_downloads
; DEFAULT: Ampache - Zip Batch Download
;file_zip_comment = "Ampache - Zip Batch Download"

; Load the debug webplayer
; This will load the *.js player instead of the *.min.js player
; The unminified player has a lot of console.log() statements in the code.
; You can make changes and then check how the player is functioning.
; DEFAULT: "false"
;webplayer_debug = "true"

; Waveform
; This settings tells Ampache to attempt to generate a waveform
; for each song. It requires transcode and encode_args_wav settings.
; You must also set tmp_dir_path in order for this to work
; DEFAULT: "false"
;waveform = "true"

; Waveform color
; The waveform color.
; DEFAULT: #FF0000
;waveform_color = "#FF0000"

; Waveform height
; The waveform height.
; DEFAULT: 32
;waveform_height = 32

; Waveform width
; The waveform width.
; DEFAULT: 400
;waveform_width = 400

; Temporary Directory Path
; If Waveform is enabled this must be set to tell
; Ampache which directory to save the temporary file to. Do not put a
; trailing slash or this will not work.
; DEFAULT: "false"
;tmp_dir_path = "/tmp"

; This setting throttles a persons downloading to the specified
; bytes per second. This is not a 100% guaranteed function, and
; you should really use a server based rate limiter if you want
; to do this correctly.
; DEFAULT: off
; VALUES: any whole number (in bytes per second)
;throttle_download = 10

; This determines if a preview image should be retrieved from video files
; It requires encode_get_image transcode settings.
; DEFAULT: "false"
;generate_video_preview = "true"

; Uncomment if don't want Ampache to follow symlinks
; DEFAULT: "false"
;no_symlinks = "true"

; Use auth?
; If this is set to "true" Ampache will require a valid
; Username and password. If this is set to false then Ampache
; will not ask you for a username and password. false is only
; recommended for internal only instances
; DEFAULT: "true"
use_auth = "true"

; Default Auth Level
; If use_auth is set to false then this option is used
; to determine the permission level of the 'default' users
; default is administrator. This setting only takes affect
; if use_auth is false
; POSSIBLE VALUES: user, admin, manager, guest
; DEFAULT: guest
default_auth_level = "guest"

; Skip Timer Threshold
; This allows custom times to decide when a track is skipped
; Allows an integer to denote seconds, or a float to denote percentage
; POSSIBLE VALUES:
; 20 = 20 seconds.
; 0.3 = 30%
; DEFAULT: 20
;skip_timer = 20

; 5 Star Ratings
; This allows ratings for almost any object in Ampache
; It also allows users to flag objects as a favorite
; POSSIBLE VALUES: false true
; DEFAULT: "true"
ratings = "true"

; Enable filtering on browse pages for artists and albums.
; If you enable this setting the get_random and browse pages
; will remove artists and albums that are <= to that rating
; DEFAULT: "false"
;rating_browse_filter = "true"

; Set the rating that will be filtered
; e.g. 2 will filter 1 and 2 star albums and artists
; this setting must be set for the filter to work
; DEFAULT: null
;rating_browse_minimum_stars = 1

; By default Ampache assigns the rating set in files tags to
; the system user (-1). If you would like ALL file tags to be
; assigned to a specific user set their user ID here.
; DEFAULT: -1
;rating_file_tag_user = 1

; Direct play
; This allows user to play directly a song or album
; POSSIBLE VALUES: false true
; DEFAULT: "true"
directplay = "true"

; Sociable
; This turns on / off all of the "social" features of Ampache
; default is on, but if you don't care and just want music
; turn this off to disable all social features.
; DEFAULT: "true"
sociable = "true"

; License
; This turns on / off all licensing features on Ampache
; DEFAULT: "false"
;licensing = "true"

; This options will turn on/off Demo Mode
; If Demo mode is on you can not play songs or update your catalog
; in other words.. leave this commented out
; DEFAULT: "false"
;demo_mode = "true"

; This options will turn on/off Simple User Mode
; If simple_user_mode is true you can not edit your profile or make
; changes to your account unless you are an admin
; This is for shared accounts or simple sites like the ampache demo
; DEFAULT: "false"
;simple_user_mode = "true"

; Caching
; This turns the caching mechanisms on or off, due to a large number of
; problems with people with very large catalogs and low memory settings
; this is off by default as it does significantly increase the memory
; requirements on larger catalogs. If you have the memory this can create
; a 2-3x speed improvement.
; DEFAULT: "false"
;memory_cache = "true"

; Memory Limit
; This defines the "Min" memory limit for PHP if your php.ini
; has a lower value set Ampache will set it up to this. If you
; set it below 16MB getid3() will not work!
; DEFAULT: 32
;memory_limit = 32

; Album Art Preferred Filename
; Specify a filename to look for if you always give the same filename
; i.e. "folder.jpg" Ampache currently only supports jpg/gif and png
; Especially useful if you have a front and a back image in a folder
; comment out if Ampache should search for any jpg, gif or png
; DEFAULT: "folder.jpg"
;album_art_preferred_filename = "folder.jpg"

; Artist Art Preferred Filename
; Specify a filename to look for artist specific art, either in the
; same folder as your files or in the parent folder
; e.g. /mnt/music/Artist/Album/artist.jpg
;      /mnt/music/Artist/artist.jpg
; DEFAULT: "folder.jpg"
;artist_art_preferred_filename = "folder.jpg"

; Artist Art Dump Folder
; Specify a local folder to search for art using name/title to identify
; i.e. "/var/www/art/" is filled with artist images named by artist
; e.g. "Megadeth.jpg", "Judas Priest.png", "The Smashing Pumpkins.jpg"
; When enabled; gather_folder will check this folder for artist images
; DEFAULT: "false"
;artist_art_folder = "/var/www/art"

; Album Art Store on Disk
; This defines if arts should be stored on disk instead of database.
; You must also set a local_metadata_dir below. This folder should be
; a local folder that is not accessible from a browser.
; DEFAULT: "false"
;album_art_store_disk = "true"

; Local Metadata Directory
; This define a local metadata directory OUTSIDE the web path with write access.
; This is used to store heavy data if enabled (album art, waveforms, etc)
; DEFAULT: none
;local_metadata_dir = "/var/www/metadata"

; Maximal upload size
; Specify the maximal allowed upload size for images, in bytes.
; DEFAULT: 1048576
;max_upload_size = 1048576

; Album Art Minimum Width
; Specify the minimum width for arts (in pixel).
; DEFAULT: 30
album_art_min_width = 30

; Album Art Maximum Width
; Specify the maximum width for arts (in pixel).
; DEFAULT: none
;album_art_max_width = 1024

; Album Art Minimum Height
; Specify the minimum height for arts (in pixel).
; DEFAULT: 30
album_art_min_height = 30

; Album Art Maximum Height
; Specify the maximum height for arts (in pixel).
; DEFAULT: none
;album_art_max_height = 1024

; Resize Images * Requires PHP-GD *
; Set this to true if you want Ampache to resize the Album
; art on the fly, this increases load time and CPU usage
; and also requires the PHP-GD library. This is very useful
; If you have high-quality album art and a small upload cap
; DEFAULT: "false"
;resize_images = "true"

; Playlist Cover Art
; Set this to true if you want Ampache to generate
; cover art for playlists automatically based on
; the content.
; DEFAULT: "true"
playlist_art = "true"

; Statistical Graphs * Requires PHP-GD *
; Set this to true if you want Ampache to generate statistical graphs on usages / users.
; This is false by default due to issues around the licensing of c-pchart.
;  https://github.com/ampache/ampache/issues/1515
;  http://www.pchart.net/license
; REFERENCE: https://github.com/ampache/ampache/wiki/chart-faq
; You can enable c-chart with the following command:
;  composer install --dev
; Or add it as a non-dev requirement with:
;  composer require szymach/c-pchart "3.*"
; DEFAULT: "false"
;statistical_graphs = "true"

; Art Gather Order
; Simply arrange the following in the order you would like
; Ampache to search. If you want to disable one of the search
; methods simply leave it out. DB should be left as the first
; method unless you want it to overwrite what's already in the
; database
; POSSIBLE VALUES (builtins): db tags folder spotify musicbrainz google
; POSSIBLE VALUES (plugins): Amazon,TheAudioDb,Tmdb,Omdb,Flickr
; DEFAULT: db,tags,folder,spotify,musicbrainz
art_order = "db,tags,folder,spotify,musicbrainz"

; Gather song art
; Gather song art additionally to the album art. This will add each
; image of a song into the database. If your database contains
; many songs not related to an album this should possibly be set to true.
; Otherwise for an environment that contains mainly full albums
; this should remain false to avoid multiple entries of the same image.
; You need to set show_song_art to true if you want to make the song images visible.
; DEFAULT = false
;gather_song_art = "true"

; Show song art
; Show song art instead of album art in web UI and Subsonic API.
; This will only work when gather_song_art is set to true AND when
; there is song art in the database.
; DEFAULT: "false"
;show_song_art = "true"

; Spotify Album art search filter
;  Narrow the search.
;  POSSIBLE VALUES:  artist,(year:1991 or year:1991-2000)
; POSSIBLE  VALUES: empty string("") or commented out for no filter
; DEFAULT: none;
;spotify_art_filter = "artist"

; Art search limit
;  Limit the total images returned
;  DEFAULT: 15
;art_search_limit = 15

; Recommendations
; Set this to true to enable display of similar artists or albums
; while browsing. Requires Last.FM.
; DEFAULT: "false"
show_similar = "{{cfg.ampache.lastfm.show_similar}}"

; Hide Searches from the API
; Set this to true and the get_indexes and playlists methods will not automatically include
; searches/smart lists in the results.
; Older versions of the Kodi Add-on will require this for playlists to work
; DEFAULT: "false"
;hide_search = "true"

; Allow or disallow upload scripts on the server
; Enable this if you trust your users
; DEFAULT: "false"
;allow_upload_scripts = "true"

;#########################################################
;      API keys                                          #
;#########################################################

; Last.FM API Key
; Set this to your Last.FM api key to actually use Last.FM for
; recommendations and metadata.
lastfm_api_key = "{{cfg.ampache.lastfm.api_key}}"

; Last.FM API secret
; Set this to your Last.FM api secret to actually use Last.FM for
; scrobbling.
; DEFAULT: none
lastfm_api_secret = "{{cfg.ampache.lastfm.api_secret}}"

; Spotify client id
; Set this to your Spotify client id to actually use Spotify for
; accessing their catalog API. (https://developer.spotify.com/dashboard/)
; DEFAULT: none
;spotify_client_id = ""

; Spotify client secret
; Both id and secret are required to access the spotify catalog.
; DEFAULT: none
;spotify_client_secret = ""

; Wanted
; Set this to true to enable display missing albums and the
; possibility for users to mark it as wanted.
; DEFAULT: "false"
wanted = "{{cfg.ampache.features.wanted}}"

; Wanted types
; Set the allowed types of wanted releases (album,compilation,single,ep,live,remix,promotion,official)
; DEFAULT: album,official
wanted_types = "album,official"

; Wanted Auto Accept
; Mark wanted requests as accepted by default (no content manager agreement required)
; DEFAULT: "false"
;wanted_auto_accept = "true"

; Labels
; Use labels to browse artists per label membership.
; DEFAULT: "false"
;label = "true"

; Broadcasts
; Allow users to broadcast music.
; This feature requires advanced server configuration, please take a look on the wiki for more information.
; DEFAULT: "false"
;broadcast = "true"

; Live Streams
; Set this to true to enable live streams (radio) and the
; possibility for users to add new live streams.
; DEFAULT: "true"
live_stream = "true"

; Podcasts
; Set this to true to enable podcasts and the
; possibility for admins to subscribe to new podcasts.
; DEFAULT: "true"
podcast = "{{cfg.ampache.features.podcast}}"

; Web Socket address
; Declare the web socket server address
; DEFAULT: determined automatically
;websocket_address = "ws://localhost:8100"

; Refresh Limit
; This defines the default refresh limit in seconds for
; pages with dynamic content, such as Now Playing
; DEFAULT: 60
; Possible Values: Int > 5
refresh_limit = "60"

; Embedded Now Playing Page
; Set this to true to enable the embedded Now Playing page (now_playing.php).
; This page allows for embedding a Now Playing badge into a stream
; or status page. Use with the parameter 'user_id' to filter by a
; specific user. This page is like rss in that it doesn't require a
; login to view.
; DEFAULT: "false"
;use_now_playing_embedded = "true"

; Now Playing Refresh Limit
; This defines the refresh limit in seconds for the
; Now Playing embedded page. This (now_playing.php) is not
; part of the normal application and is designed to be
; embedded in another app, like a stream or status page.
; If this value is not valid, automatic refresh will be disabled.
; DEFAULT: -1
; Possible Values; Int > 1
;now_playing_refresh_limit = "-1"

; Now Playing Custom CSS
; This defines the custom css file for the Now Playing embedded
; page. This (now_playing.php) is not part of the normal
; application and is designed to be embedded in another app, like
; a stream or status page.
; If this value is not set, no CSS will be used. Custom CSS can
; still be applied in the other application, like OBS.
; DEFAULT: "templates/now-playing.css"
;now_playing_css_file = "templates/now-playing.css"

; Footer Statistics
; This defines whether statistics (Queries, Cache Hits, Load Time)
; are shown in the page footer.
; DEFAULT: "true"
show_footer_statistics = "{{cfg.ampache.features.show_footer_statistics}}"

; RSS Feeds
; Set this to true to enable rss feeds.
; (latest albums, shouts, albums of artist, ...)
; use_rss = false (values true | false)
; DEFAULT: "false"
;use_rss = "true"

; This setting allows themes to overwrite PHP template files. This can be really
; dangerous. Do this only if you trust every theme in your themes/ directory.
; DEFAULT: "false"
;allow_php_themes = "true"

;#########################################################
; Debugging                                              #
;#########################################################

; Debug
; If this is enabled Ampache will write debugging information to the log file
; DEFAULT: "false"
debug = "{{cfg.ampache.debug}}"

; Debug Level
; This should always be set in conjunction with the
; debug option, it defines how prolific you want the
; debugging in Ampache to be. values are 1-5.
; 1 == Basic Errors
; 2 == Errors + Failures (login attempts etc.)
; 3 == Full Error Information
; 4 == General Information
; 5 == Full Information (cataloging progress etc.)
; DEFAULT: 5
debug_level = 5

; Path to Log File
; This defines where you want Ampache to log events to
; this will only happen if debug is turned on. Do not
; include trailing slash. You will need to make sure that
; the specified directory exists and your HTTP server has
; write access.
; DEFAULT: none
log_path = "{{pkg.svc_path}}/logs"

; Log filename pattern
; This defines where the log file name pattern
; %name.%Y%m%d.log will create a different log file every day.
; DEFAULT: %name.%Y%m%d.log
log_filename = "%name.%Y%m%d.log"

;#########################################################
; Encoding Settings                                      #
;#########################################################

; Charset of generated HTML pages
; Default of UTF-8 should work for most people
; DEFAULT: UTF-8
site_charset = UTF-8

; Locale Charset
; Local charset (mainly for file operations) if different
; from site_charset.
; This is disabled by default, enable only if needed
; (for Windows please set lc_charset to ISO8859-1)
; DEFAULT: ISO8859-1
;lc_charset = "ISO8859-1"

; Multibyte
; See http://php.net/manual/mbstring.supported-encodings.php
; If you want ID3v1 encoding detection to work, you should uncomment this line
; so that the ordering is sane.
; DEFAULT: auto
;mb_detect_order = "ASCII,UTF-8,EUC-JP,ISO-2022-JP,SJIS,JIS"

;#########################################################
; Custom actions (optional)                              #
;#########################################################

; Your custom play action title
;custom_play_action_title_0 = ""
; Your custom play action icon name (stored as /images/icon_[your_image].png)
;custom_play_action_icon_0 = ""
; Your custom action script, where:
;   - %f: the media file path
;   - %c: the excepted codec target (mp3, ogg, ...)
;   - %a: the artist name
;   - %A: the album name
;   - %t: the song title
; DEFAULT: none
;custom_play_action_run_0 = ""

; Example for Karaoke playing
;custom_play_action_title_0 = "Karaoke"
;custom_play_action_icon_0 = "microphone"
;custom_play_action_run_0 = "sox \"%f\" -p oops | ffmpeg -i pipe:0 -f %c pipe:1"

;#########################################################
; LDAP login info (optional)                             #
;#########################################################

; LDAP server URL (required)
; DEFAULT: none
;ldap_url = "ldap://localhost/"
;ldap_url = "ldaps://localhost/"

; LDAP credentials (optional)
; DEFAULT: none
;ldap_username = ""
;ldap_password = ""

; LDAP Base DN for the search (required)
; DEFAULT: none
;ldap_search_dn = "ou=People,dc=yoursubdomain,dc=yourdomain,dc=yourtld"

; LDAP objectClass (required)
; DEFAULT: none
;ldap_objectclass = "posixAccount"          ; OpenLDAP
;ldap_objectclass = "organizationalPerson"  ; Microsoft Active Directory

; LDAP filter for search (required)
; DEFAULT: none
;ldap_filter = "(uid=%v)"                   ; OpenLDAP
;ldap_filter = "(sAMAccountName=%v)"        ; Microsoft Active Directory

; Require that the user is in a specific group (optional)
; DEFAULT: none
;ldap_require_group = "cn=yourgroup,ou=yourorg,dc=yoursubdomain,dc=yourdomain,dc=yourtld"

; LDAP name field
; DEFAULT: cn
;ldap_name_field = "cn"
;ldap_name_field = "displayName"

; LDAP email field
; DEFAULT: mail
;ldap_email_field = "mail"

; LDAP avatar field
; DEFAULT: none
;ldap_avatar_field = "jpegPhoto"

; LDAP avatar mime type
; DEFAULT: image/jpeg
;ldap_avatar_mime = "image/jpeg"

; LDAP protocol version to use
; DEFAULT: 3
;ldap_protocol_version = 3

; LDAP StartTLS
; DEFAULT: "false"
;ldap_start_tls = "true"

; LDAP member attribute name.
; That's the name of the attribute of the group that will contain
; the usernames.
; DEFAULT: member
;ldap_member_attribute = "member"
;ldap_member_attribute = "memberuid"

;#########################################################
; OpenID login info (optional)                           #
;#########################################################

; Requires specific OpenID Provider Authentication Policy
; DEFAULT: none
; VALUES: PAPE_AUTH_MULTI_FACTOR_PHYSICAL,PAPE_AUTH_MULTI_FACTOR,PAPE_AUTH_PHISHING_RESISTANT
;openid_required_pape = ""

;#########################################################
; Public Registration settings, defaults to disabled     #
;#########################################################

; This setting will silently create an Ampache account
; for anyone who can login using LDAP (or any other login
; extension). The default is to create new users as guests
; see auto_user config option if you would like to change this
; DEFAULT: "false"
;auto_create = "true"

; This setting will silently update an Ampache account's
; information for anyone who can login using LDAP
; (or any other login extension).
; DEFAULT: "false"
;external_auto_update = "true"

; This setting turns on/off public registration. It is
; recommended you leave this off, as it will allow anyone to
; sign up for an account on your server.
; REMEMBER: don't forget to set the mail from address further down in the config.
; DEFAULT: "false"
;allow_public_registration = "true"

; Require Captcha Text on Image confirmation
; Turning this on requires the user to correctly
; type in the letters in the image created by Captcha
; Default is off because its very hard to detect if it failed
; to draw, or they failed to enter it.
; DEFAULT: "false"
;captcha_public_reg = "true"

; This setting turns on/off admin notification of registration.
; DEFAULT: "false"
;admin_notify_reg = "true"

; This setting determines whether the user will be created as a disabled user.
; If this is on, an administrator will need to manually enable the account
; before it's usable.
; DEFAULT: "false"
;admin_enable_required = "true"

; This setting will allow all registrants/ldap/http users
; to be auto-approved as a user. By default, they will be
; added as a guest and must be promoted by the admin.
; POSSIBLE VALUES: guest, user, admin
; DEFAULT: guest
;auto_user = "guest"

; This will display the user agreement when registering
; For agreement text, edit config/registration_agreement.php
; User will need to accept the agreement before they can register
; DEFAULT: "false"
;user_agreement = "true"

; This disable email confirmation when registering.
; DEFAULT: "false"
;user_no_email_confirm = "true"

; This will display the cookie disclaimer (EU Cookie Law)
; DEFAULT: "false"
;cookie_disclaimer = "true"

; The fields that will be shown on Registration page
; If a user wants to register.
; Username and email fields are forced.
; POSSIBLE VALUES: fullname,website,state,city
; DEFAULT: "fullname,website"
registration_display_fields = "fullname,website"

; The fields that will be mandatory
; This controls which fields are mandatory for registration.
; Username and email fields are forced mandatory.
; POSSIBLE VALUES: fullname,website,state,city
; DEFAULT: "fullname"
registration_mandatory_fields = "fullname"

;#########################################################
; These options control the dynamic downsampling based   #
; on current usage                                       #
; *Note* Transcoding must be enabled and working         #
;#########################################################

; Attempt to optimize bandwidth by dynamically lowering the bit rate of new
; streams. Since the bit rate is only adjusted at the beginning of a song, the
; actual cumulative bitrate for concurrent streams can be up to around
; double the configured value. It also only applies to streams that are
; transcoded.
; DEFAULT: none
;max_bit_rate = 576

; New dynamically downsampled streams will be denied if they are forced below
; this value.
; DEFAULT: 8
;min_bit_rate = 48

;#########################################################
; Transcode Settings                                     #
;#########################################################

; These are commands used to transcode non-streaming
; formats to the target file type for streaming.
; This can be useful in re-encoding file types that don't stream
; very well, or if your player doesn't support some file types.
;
; 'Downsampling' will also use these commands.
;
; To state the bleeding obvious, any programs referenced in the transcode
; commands must be installed, in the web server's search path (or referenced
; by their full path), and executable by the web server.

; Input type selection
; TYPE is the extension. 'allowed' certifies that transcoding works properly for
; this input format. 'required' further forbids the direct streaming of a format
; (e.g. if you store everything in FLAC, but don't want to ever stream that.)
; transcode_TYPE = {allowed|required|false}
; DEFAULT: "false"
;;; Audio
;transcode_m4a = "allowed"
;transcode_flac = "required"
;transcode_mpc = "required"
;transcode_ogg = "required"
;transcode_oga = "required"
;transcode_opus = "required"
;transcode_wav = "required"
;transcode_wma = "required"
;transcode_aif = "required"
;transcode_aiff = "required"
;transcode_ape = "required"
;transcode_shn = "required"
transcode_mp3 = "allowed"
;;; Video
;transcode_avi = "allowed"
;transcode_flv = "allowed"
;transcode_mkv = "allowed"
;transcode_mpg = "allowed"
;transcode_mpeg = "allowed"
;transcode_m4v = "allowed"
;transcode_mp4 = "allowed"
;transcode_mov = "allowed"
;transcode_wmv = "allowed"
;transcode_ogv = "allowed"
;transcode_divx = "allowed"
;transcode_m2ts = "allowed"
;transcode_webm = "allowed"

; Default audio output format
; DEFAULT: none
;encode_target = mp3

; Default video output format
; DEFAULT: none
;encode_video_target = webm

; Override the default output format on a per-type basis, for example,
; to stream lossless encoded files in lossy formats.
; encode_target_TYPE = TYPE
; DEFAULT: none
;encode_target_flac = opus

; Override the default TYPE transcoding behavior on a per-player basis, for example,
; to stream lossless using the api and lossy using the web interface.
; transcode_player_PLAYER_TYPE = TYPE
; Valid PLAYER is: webplayer, api
; DEFAULT: none
;transcode_player_webplayer_m4a = "required"
;transcode_player_webplayer_flac = "required"
;transcode_player_webplayer_mpc = "required"

; Override the default output format on a per-player basis
; encode_player_PLAYER_target = TYPE
; Valid PLAYER is: webplayer, api
; DEFAULT: none
;encode_player_webplayer_target = mp3
;encode_player_api_target = mp3

; Allow clients to override transcode settings (output type, bitrate, codec ...)
; DEFAULT: "true"
transcode_player_customize = "true"

; Command configuration. Substitutions will be made as follows:
; %FILE% => filename
; %BITRATE% => target bit rate (as chosen by the admin or users in the
; preferences, if transcode_player_customize = "true")
; You can do fancy things like VBR, but consider whether the consequences are
; acceptable in your environment.

; Master transcode command
; transcode_cmd should be a single command that supports multiple file types,
; such as ffmpeg or avconv. It's still possible to make a configuration that's
; equivalent to the old default, but if you find that necessary you should be
; clever enough to figure out how on your own.
; DEFAULT: none
;transcode_cmd = "ffmpeg"
;transcode_cmd = "avconv"
;transcode_cmd = "/usr/bin/neatokeen"

; Transcode input file argument
transcode_input = "-i %FILE%"

; Specific transcode commands
; It shouldn't be necessary in most cases, but you can override the transcode
; command for specific source formats.  It still needs to accept the
; encoding arguments, so the easiest approach is to use your normal command as
; a clearing-house.
; transcode_cmd_TYPE = TRANSCODE_CMD
;transcode_cmd_mid = "timidity -Or -o – %FILE% | ffmpeg -f s16le -i pipe:0"

; Encoding arguments
; For each output format, you should provide the necessary arguments for
; your transcode_cmd.
; encode_args_TYPE = TRANSCODE_CMD_ARGS
encode_args_mp3 = "-vn -b:a %BITRATE%K -c:a libmp3lame -f mp3 pipe:1"
encode_args_ogg = "-vn -b:a %BITRATE%K -c:a libvorbis -f ogg pipe:1"
encode_args_opus = "-vn -b:a %BITRATE%K -c:a libopus -compression_level 10 -f ogg pipe:1"
encode_args_m4a = "-vn -b:a %BITRATE%K -c:a libfdk_aac -f adts pipe:1"
encode_args_wav = "-vn -b:a %BITRATE%K -c:a pcm_s16le -f wav pipe:1"
encode_args_flv = "-b:a %BITRATE%K -ar 44100 -ac 2 -v 0 -f flv -c:v libx264 -preset superfast -threads 0 pipe:1"
encode_args_webm = "-b:a %BITRATE%K -f webm -c:v libvpx -preset superfast -threads 0 pipe:1"
encode_args_ts = "-q %QUALITY% -s %RESOLUTION% -f mpegts -c:v libx264 -c:a libmp3lame -maxrate %MAXBITRATE%k -preset superfast -threads 0 pipe:1"
encode_args_ogv = "-codec:v libtheora -qscale:v 7 -codec:a libvorbis -qscale:a 5 -f ogg pipe:1"

; Encoding arguments to retrieve an image from a single frame
encode_get_image = "-ss %TIME% -f image2 -vframes 1 pipe:1"

; Encoding argument to encrust subtitle
encode_srt = "-vf \"subtitles='%SRTFILE%'\""

; Encode segment frame argument
encode_ss_frame = "-ss %TIME%"

; Encode segment duration argument
encode_ss_duration = "-t %DURATION%"

; Use segments for transcoding or send it all in one go.
; Useful if you are having issues streaming the full track.
; You can set it for all streams or a specific player
; POSSIBLE VALUES: true webplayer api
; DEFAULT: "webplayer"
send_full_stream = "webplayer"

;#########################################################
; Transcode Caching                                      #
;#########################################################

; These are commands used to pre-cache a file format for streaming.
; This helps avoid waiting for transcodes to finish and makes
; files immediately available to the client.

; Path to your cache folder.
; This is where the pre-transcoded files will be stored
; DEFAULT: none
;cache_path = "/tmp"

; Default audio output format
; This is what you want your cached format to be.
; This should match your 'encode_target' in Transcode Settings
; POSSIBLE VALUES: mp3 opus ogg
; DEFAULT: none
;cache_target = "mp3"

; Look in your local catalogs for these file extensions and pre-cache to the
; 'cache_path'. This could be helpful to reduce space needed on your
; web server or to make sure that clients get files quickly.
; Execute "php bin/cli run:cacheProcess" to process these files.
; DEFAULT: "false"
;cache_m4a = "true"
;cache_flac = "true"
;cache_mpc = "true"
;cache_ogg = "true"
;cache_oga = "true"
;cache_opus = "true"
;cache_wav = "true"
;cache_wma = "true"
;cache_aif = "true"
;cache_aiff = "true"
;cache_ape = "true"
;cache_shn = "true"
;cache_mp3 = "true"

; REMOTE CATALOGS ONLY
; Enabling cache_remote on remote catalogs will cache every file on the remote server
; DEFAULT: "false"
;cache_remote = "true"

;#########################################################
; Proxy Settings (optional)                              #
;#########################################################

; If Ampache is behind an http proxy, specify the hostname or IP address
; port, proxy username, and proxy password here.
; DEFAULT: not in use
;proxy_host = "192.168.0.1"
;proxy_port = "8080"
;proxy_user = ""
;proxy_pass = ""

; If Ampache is behind an https reverse proxy, force use HTTPS protocol.
; DEFAULT: "false"
force_ssl = "{{cfg.ampache.force_ssl}}"

;#########################################################
;  Mail Settings                                         #
;#########################################################

; Enable or disable email server features
; otherwise, you can reset your password
; and never receive an email with the new one
; Default: "false"
mail_enable = "{{cfg.ampache.mail.enable}}"

; Method used to send mail
; POSSIBLE VALUES: smtp sendmail php
; DEFAULT: php
mail_type = "{{cfg.ampache.mail.type}}"

; Mail domain.
; DEFAULT: example.com
mail_domain = "{{cfg.ampache.mail.domain}}"

; This will be combined with mail_domain and used as the source address for
; emails generated by Ampache.  For example, setting this to 'me' will set the
; sender to 'me@example.com'.
; DEFAULT: info
mail_user = "{{cfg.ampache.mail.user}}"

; A name to go with the email address.
; DEFAULT: Ampache
;mail_name = "Ampache"

; How strictly email addresses should be checked.
; easy does a regex match, strict actually performs some SMTP transactions
; to see if we can send to this address.
; POSSIBLE VALUES: strict easy none
; DEFAULT: strict
;mail_check = "strict"

;#########################################################
;  sendmail Settings                                     #
;#########################################################

; DEFAULT: /usr/sbin/sendmail
sendmail_path = "{{cfg.ampache.mail.sendmail.path}}"

;#########################################################
;  SMTP Settings                                         #
;#########################################################

; Mail server (hostname or IP address)
; DEFAULT: localhost
mail_host = "{{cfg.ampache.mail.smtp.host}}"

; SMTP port
; DEFAULT: 25
mail_port = {{cfg.ampache.mail.smtp.port}}

; Secure SMTP
; POSSIBLE VALUES: ssl tls
; DEFAULT: none
mail_secure_smtp = "{{cfg.ampache.mail.smtp.security}}"

; Enable SMTP authentication
; DEFAULT: "false"
mail_auth = "{{cfg.ampache.mail.smtp.auth}}"

; SMTP username
; your mail auth username.
; DEFAULT: none
mail_auth_user = "{{cfg.ampache.mail.smtp.user}}"

; SMTP password
; your mail auth password.
; DEFAULT: none
mail_auth_pass = "{{cfg.ampache.mail.smtp.password}}"

;#########################################################
;   Abbreviation Filter                                  #
;#########################################################

; For file name parsing. Any unnecessary abbreviations in file names can be removed during parsing
; by adding them to the list below so that they will be removed during the parsing process.
common_abbr = "divx,xvid,dvdrip,hdtv,lol,axxo,repack,xor,pdtv,real,vtv,caph,2hd,proper,fqm,uncut,topaz,tvt,notv,fpn,fov,orenji,0tv,omicron,dsr,ws,sys,crimson,wat,hiqt,internal,brrip,boheme,vost,vostfr,fastsub,addiction,x264,LOL,720p,1080p,YIFY,evolve,fihtv,first,bokutox,bluray,tvboom,info"
