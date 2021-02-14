<?= '<?xml version="1.0" encoding="UTF-8" ?>' ?>
<!--	created with mscms.com.ua	-->
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
    <url>
        <loc><?= base_url();?></loc>
        <priority>1.0</priority>
    </url>
<?php if(isset($pages) && !empty($pages))
{ foreach($pages as $url) { ?>
    <url>
        <loc><?= base_url().'page/'.$url['meta_url'] ?></loc>
        <lastmod><?=$url['edited_date']!='' ? $url['edited_date'] : $url['created_date']?></lastmod>
        <priority>0.5</priority>
    </url>
<?php } } ?>
<?php if(isset($category) && !empty($category))
{ foreach($category as $url) { ?>
    <url>
        <loc><?= base_url().'category/'.$url['meta_url'] ?></loc>
        <priority>0.5</priority>
    </url>
<?php } } ?>
<?php if(isset($products) && !empty($products))
{ foreach($products as $url) { ?>
    <url>
        <loc><?= base_url().'store/product/'.$url['meta_url'] ?></loc>
        <lastmod><?=$url['updated_date']!='' ? $url['updated_date'] : $url['created_date']?></lastmod>
        <priority>0.5</priority>
    </url>
<?php } } ?>
<?php if(isset($catalogs) && !empty($catalogs))
{ foreach($catalogs as $url) { ?>
    <url>
        <loc><?= base_url().'store/catalog/'.$url['meta_url'] ?></loc>
        <priority>0.5</priority>
    </url>
<?php } } ?>

</urlset>
