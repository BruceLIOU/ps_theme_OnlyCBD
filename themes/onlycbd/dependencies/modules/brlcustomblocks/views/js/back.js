/**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/

$(document).ready(function () {

    // afficher un pointer sur le tableau pour montrer qu'il est draggable
    $('#table-brlcustomblocksDrag').css('cursor', 'pointer');
    // créé un objet de tous les tr présent dans le tableau indiqué
    var tr = $('#table-brlcustomblocksDrag').find('tr');
    // récupérer la longueur du tableau
    trLength = $('#table-brlcustomblocksDrag tr').length;

    // pour chaque boucle, insére un id à chaque tr
    for (i=0; i <= trLength; i++) {
        var idCustomBlocks = $(tr[i]).find('.brlIdCustomBlocks').text();
        // retire les espaces
        idCustomBlocks = $.trim(idCustomBlocks);
        // pour ne pas mettre l'id dans le tr du thead, et la th vide de recherche
        if (idCustomBlocks != "Id" && idCustomBlocks) {
            // créé les id avec l'id de chaque attribut
            $(tr[i]).attr('id',idCustomBlocks);
            // créé une classe personnalisée
            $(tr[i]).attr('class','position-ajax');
        }
    }

    // cache la colonne des positions dans le tableau
    $('td:nth-child(9),th:nth-child(9)').hide();
    // cache la colonne des ids dans le tableau
    $('td:nth-child(8),th:nth-child(8)').hide();

    // fais un appel AJAX pour updater en BDD en même temps que l'on déplace les éléments du tableau
    $('#table-brlcustomblocksDrag tbody').sortable({
        // ne peut déplacer que sur la verticale
        axis: 'y',
        cursor: "move",
        opacity: 0.6,
        update: function (event, ui) {
            var datas = [];
            $('.position-ajax').each(function () {
                datas.push($(this).attr('id'));
            });
            $.ajax({
                type: 'POST',
                dataType: 'JSON',
                url: controller_ajax_url,
                data: {
                    ajax: true,
                    action: 'UpdatePosition',
                    datas: datas,
                },
                success: function (data) {
                    if (data == 'success') {
                        showSuccessMessage(successPosition);
                    }  else {
                        showErrorMessage(errorPosition);
                    }
                }
            });
        }
    });
});