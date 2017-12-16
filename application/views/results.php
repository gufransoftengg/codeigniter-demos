<!DOCTYPE html>
<html lang = "en">

    <head>
        <meta charset = "utf-8">
        <title><?php print $title;?></title>
    </head>

    <body>
        <?php if (!empty($result1)) { ?>
            <article class="container search-results">

                <table class="table table-hover">

                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Description</th>
                    </tr>

                    <?php
                    $i = 0;
                    foreach ($result1 as $st): $i++;
                        ?>
                        <tr<?php if (($i % 2) == 1) { ?> class="active" <?php } ?>>
                            <td><?= $i ?></td>
                            <td><a href="<?= base_url() ?><?= $st['ModuleName'] ?>/<?= $st['id'] ?>"><?= $st['name'] ?></a> </td>
                            <td>
                                <?php if (!empty($st['FileName'])) { ?>
                                    <img alt="<?= $st['name']; ?>" src="<?= base_url() ?>root/<?= $st['FileName'] ?>" class="media-object img-responsive"  title="<?= $st['name'] ?>" >
        <?php } ?>
                            </td>
                            <td><?= strip_tags(word_split($st['descrip'], 25)) ?></td>
                        </tr>

    <?php endforeach; ?>
                </table>

                <table class="table table-bordered table-hover">
                    <tr>
                        <td colspan="3" class="pager">
                            <div class="resultsCount"><b> Results From <?= $row + 1 ?> To <?= $row + 10 ?>&nbsp;FROM ALL&nbsp;<?= $total_rows; ?> Result</b></div>
                            <!--<div class="pages">-->
    <?= $links; ?>
                            <!--</div>-->
                        </td>
                    </tr>
                </table>
            </article>
        <?php } else { ?>
            <p class='notice information'>Sorry there is no result for this keyword,Try using another</p>
<?php } ?>
        <script src="<?= base_url() ?>/root/js/jquery.highlight.js"></script>
        <script>
            $(document).ready(function () {
                $('.search-results').highlight("<?= $search_word['search_word'] ?>");
            });
        </script>
    </body>

</html>