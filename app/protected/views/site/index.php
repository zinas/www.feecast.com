<div class="jumbotron">
    <div class="container">
        <h1>FeeCast</h1>
        <?php /*$this->widget('widgets.SearchWidget');*/ ?>
        <p>Eliminate the unknown.</p>
        <p>Healthcare provider fees at your fingertips.</p>
        <form role="form">
            <div class="row form-group">
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="search-need" placeholder="Describe need or enter CPT code">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="search-provider" placeholder="Health insurance provider">
                </div>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="search-location" placeholder="Location">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-4">
                    <button class="btn-primary btn-large btn form-control">Search</button>
                </div>
            </div>
        </form>
    </div>
</div>
