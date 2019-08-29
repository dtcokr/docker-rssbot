# docker-rssbot

Fork from [darkskygit(github)](https://www.github.com/darkskygit/rustrssbot-docker), source code by [iovxw(github)](https://github.com/iovxw/rssbot), very handy if you are an active(HARDCORE) Telegram user and eager to obtain information through the [old fashion RSS feed way](https://www.pcmag.com/news/309255/google-reader-bites-the-dust-whos-next).

Run it on **ANY** 24/7(or not) operating machines, it's up to you entirely.

## usage

1. **You don't have to create the datafile(a JSON file that stores all your RSS subscription list)** at the first place, it will generate one **automatically**. All you need to do is to mount a volume(with the `-v` flag) to store the file if you want to **keep the RSS subscription** when the container is stopped and removed.
2. To get a `TELEGRAM-BOT-TOKEN`, just talk to the Mighty [BotFather(Telegram)](https://t.me/BotFather). If you have one, just define the environment variable with the `-e` flag.

*Example:*

```
$ docker run -d \
  --name rssbot \
  -v /path/to/store/datafile:/rss \
  -e TK=YOUR:TELEGRAM-BOT-TOKEN \
  dtcokr/rssbot
```

### *optional
You can define the fetch frequency by defining the environment variable `INTVL` with the `-e` flag(default `300` seconds). 

*Example:*
**Recommanded*
```
$ docker run -d \
  --name rssbot \
  -v /path/to/store/datafile:/rss \
  -e TK=YOUR:TELEGRAM-BOT-TOKEN \
  -e INTVL=600 \
  dtcokr/rssbot
```

*Other simple way:*
**Just put it on the end*

```
$ docker run -d \
  --name rssbot \
  -v /path/to/store/datafile:/rss \
  -e TK=YOUR:TELEGRAM-BOT-TOKEN \
  dtcokr/rssbot 600
```


## build
Speaking of building this image, you can modify the fetch frequency using the `--build-arg` if you really hate being bound by the default settings(which is `300` seconds, which is good and not bringing too much pressure to the website).

*Example:*
*If you would like to fetch the content every 10 minutes(that is `600` seconds), then do*
```
$ docker build --build-arg INTVL=600 -t whatever-name-you-like-none-of-my-business .
```

#### That's all, very simple huh?
