<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-book"></i> Manajemen Transaksi
        <small>Tambah, Ubah, Hapus</small>
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                    <a class="btn btn-primary" href="<?php echo base_url(); ?>transaction/add"><i class="fa fa-plus"></i> Tambah Baru</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Daftar Transaksi</h3>
                    <div class="box-tools">
                        <form action="<?php echo base_url() ?>transactionListing" method="POST" id="searchList">
                            <div class="input-group">
                              <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                              <div class="input-group-btn">
                                <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                              </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                        <th>Nama</th>
                        <th>Deskripsi</th>
                        <th>Jumlah</th>
                        <th>Jenis</th>
                        <th>Tanggal</th>
                        <th>Diposting Oleh</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                    <?php
                    if(!empty($transactionRecords))
                    {
                        foreach($transactionRecords as $record)
                        {
                    ?>
                    <tr>
                        <td><?php echo $record->name ?></td>
                        <td><?php echo $record->description ?></td>
                        <td><?php echo $record->amount ?></td>
                        <td><?php echo ($record->type == 1) ? "Pemasukkan" : "Pengeluaran" ?></td>
                        <td><?php echo date("d-m-Y", strtotime($record->transDate)) ?></td>
                        <td><?php echo $record->uname ?></td>
                        <td class="text-center">
                            <?php if (!empty($record->files)) : ?>
                            <a class="btn btn-sm btn-success view-receipt" href="javascript:void(0)" title="View" data-src="<?php echo base_url() . "/assets/uploaded/receipts/" . $record->files ?>"><i class="fa fa-eye"></i></a>
                            <?php endif ?>
                            <a class="btn btn-sm btn-info" href="<?php echo base_url().'transaction/edit/'.$record->id; ?>" title="Edit"><i class="fa fa-pencil"></i></a>
                            <a class="btn btn-sm btn-danger deleteTransaction" href="javascript:void(0)" data-id="<?php echo $record->id; ?>" title="Delete"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
                  
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                    <?php echo $this->pagination->create_links(); ?>
                </div>
              </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('ul.pagination li a').click(function (e) {
            e.preventDefault();            
            var link = $(this).get(0).href;            
            var value = link.substring(link.lastIndexOf('/') + 1);
            $("#searchList").attr("action", baseURL + "transactionListing/" + value);
            $("#searchList").submit();
        });
    });

    var modal = document.getElementById("myModal");

    $('.view-receipt').click(function(){
        var src = $(this).data('src');
        var modalImg = document.getElementById("img01");

        modal.style.display = "block";
        modalImg.src = src;
    });

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() { 
        modal.style.display = "none";
    }
</script>
