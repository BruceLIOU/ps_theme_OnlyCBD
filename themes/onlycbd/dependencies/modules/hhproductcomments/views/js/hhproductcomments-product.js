/**
 * Hervé HENNES
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file docs/licenses/LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to contact@h-hennes.fr so we can send you a copy immediately.
 *
 * @author    Hervé HENNES <contact@h-hhennes.fr>
 * @copyright since 2022 Hervé HENNES
 * @license   https://opensource.org/licenses/AFL-3.0  Academic Free License ("AFL") v. 3.0
 */
// Suite au déplacement des informations des commentaires dans les onglets il faut gérer l'ouverture de l'onglet pour voir les contenus
document.querySelectorAll('.show-comments-header').forEach(function (e) {
    e.addEventListener("click", function (e) {
        let reviewBlock = document.querySelector('#hh-product-comments_button');
        if ( reviewBlock) {
            reviewBlock.click();
        }
    });
});