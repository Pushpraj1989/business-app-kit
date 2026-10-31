# Business App Kit

**Build your business app in a day. Your own ordering website, admin console and customer app. Free and open source. 0% commission.**

Marketplaces and delivery platforms take a cut of every order. This doesn't. Download it, put your business's name,
colours and products in, and take orders directly from your customers. There's no subscription, no per-order fee and
no middleman, and the customer list and orders are yours.

It works for restaurants and cafés, bakeries, fashion and beauty shops, pharmacies and supplement shops, grocers and
florists. You pick **restaurant** or **shop** mode in the admin console, and the wording, the checkout and the order
flow follow.

## What you get

| Part | What it does |
| --- | --- |
| **Customer website** | Menu or shop, search, photos and videos, cart, checkout, order tracking, offers. Works on phones like an app. |
| **Customer app** | The same experience as an app: runs in any browser at `/app/`, and can be built for iPhone and Android. |
| **Admin console** | Live orders board, products and prices, photos and videos, promotions and banners, vouchers, delivery zones on a map, sales dashboard, staff, theme and brand colour. |

**Restaurant mode:** dishes, delivery, pickup and pay on arrival, a kitchen-style orders board.

**Shop mode:**
- Product options such as sizes and colours, each with its own price, and stock counts that go down as orders come in.
- Courier shipping: shipping rates (with free shipping over an amount), a shipping address at checkout, and "mark shipped" with carrier and tracking number, which the customer sees.
- Returns: a return window you set, customers ask for a return from their order, you approve or reject it, put the items back in stock, and refund (to the card for card orders, or by hand).

Also included, in both modes:
- English and Arabic, with right-to-left layout.
- Guest ordering, so customers don't need an account.
- Sign-in with an email code, and Face ID or passkeys on supported phones.
- Cash on delivery and pay on arrival.
- Optional card payments with your own Stripe account.
- Optional AI assistant with your own key.
- Order printing and a partner API.

It's white-label: every business that installs it shows its own name, logo and colours.

## Install (one command)

You need a server running Ubuntu 22.04 or 24.04 (any VPS with 2 GB of memory or more). Then run:

```bash
curl -fsSL https://raw.githubusercontent.com/Pushpraj1989/business-app-kit/main/install.sh | sudo DOMAIN=order.example.com bash
```

- **`DOMAIN`** is your business's web address. Point its DNS A record at the server first.
- **No domain yet?** Use `DOMAIN=ip`. You get a free HTTPS address made from the server's IP, like
  `203-0-113-10.sslip.io`.

The installer sets up everything: the database, HTTPS, the website, the admin console and the customer web app.
When it finishes, open:

- `https://your-address/` for the customer website
- `https://your-address/app/` for the customer app
- `https://your-address/console/` for the admin console

The staff password is printed by `grep ADMIN_PASSWORD /etc/food-app.env`. Then add your email settings (for sign-in
codes) and your menu. The full guide is [`food-app/deploy/README.md`](food-app/deploy/README.md).

To update later, run:

```bash
WITH_APP=1 bash /srv/food-app/repo/food-app/deploy/update.sh
```

## What it costs you

The software is free. You still pay for:
- **A server.** A small VPS costs a few dollars a month.
- **A domain**, if you want your own name. This is optional, because `DOMAIN=ip` works without one.
- **Card processing fees** from Stripe, if you turn on card payments. Cash orders cost nothing.

## Run it on your computer (for developers)

See [`food-app/README.md`](food-app/README.md): Next.js 15 with Postgres and PostGIS (API and website), React and
Vite (admin console), and Flutter (customer app).

## The launch video

The launch film is built as code with Remotion, in [`food-app/promo-video`](food-app/promo-video). Change the words,
render again. The sector screens in it are the real app set up as different businesses. Their photos are free CC0 or
public-domain pictures, credited in `food-app/promo-video/public/sectors/SOURCES.md`.

## Demo photos and videos

The food photos and clips used in the demo are AI-generated illustrations. Replace them with photos of your own
products before you open to customers.

## Licence

[Apache License 2.0](LICENSE). Use it, change it, and run it for your business or for your clients' businesses, free of
charge. Keep the licence and the [NOTICE](NOTICE) file with it. Contributions are welcome: open an issue or a pull
request.
