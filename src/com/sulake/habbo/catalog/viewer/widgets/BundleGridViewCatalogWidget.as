// by nota

//com.sulake.habbo.catalog.viewer.widgets.BundleGridViewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.viewer.IItemGrid;
    import com.sulake.habbo.catalog.viewer._SafeStr_3300;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import com.sulake.habbo.catalog.viewer._SafeStr_3266;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;

    public class BundleGridViewCatalogWidget extends CatalogWidget implements _SafeStr_3303, IItemGrid, _SafeStr_3300 
    {

        private var _offer:_SafeStr_3141;
        private var _gridItemLayout:XML;
        private var _itemGrid:IItemGridWindow;

        public function BundleGridViewCatalogWidget(_arg_1:_SafeStr_3133)
        {
            super(_arg_1);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            events.addEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
            var _local_1:XmlAsset = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            _gridItemLayout = (_local_1.content as XML);
            _itemGrid = IItemGridWindow(_window.findChildByName("bundleGrid"));
            return (true);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener("SELECT_PRODUCT", onSelectProduct);
                events.removeEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
                super.dispose();
            };
        }

        private function onWidgetsInitialized(_arg_1:CatalogWidgetEvent):void
        {
            var _local_2:* = null;
            if (page.offers.length == 1)
            {
                _local_2 = page.offers[0];
                if (_local_2 != null)
                {
                    events.dispatchEvent(new SelectProductEvent(_local_2));
                };
            };
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            _offer = _arg_1.offer;
            _itemGrid.destroyGridItems();
            populateItemGrid();
        }

        protected function populateItemGrid():void
        {
            var _local_5:* = null;
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_2:_SafeStr_3133 = (_offer.page.viewer.catalog.windowManager.buildFromXML(_gridItemLayout) as _SafeStr_3133);
            for each (var _local_3:_SafeStr_3151 in _offer.productContainer.products)
            {
                if (_local_3.productType != "b")
                {
                    _local_5 = (_local_2.clone() as _SafeStr_3133);
                    _local_1 = _local_5.findChildByName("clubLevelIcon");
                    if (_local_1 != null)
                    {
                        _local_1.visible = false;
                    };
                    _itemGrid.addGridItem(_local_5);
                    _local_3.view = _local_5;
                    _local_4 = _local_3.initIcon(this);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    };
                    _local_3.grid = this;
                };
            };
        }

        public function get offer():_SafeStr_3141
        {
            return (_offer);
        }

        public function select(_arg_1:_SafeStr_3266, _arg_2:Boolean):void
        {
        }

        public function startDragAndDrop(_arg_1:_SafeStr_3266):Boolean
        {
            return (false);
        }

        public function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void
        {
        }

        public function activate():void
        {
        }

        public function get products():Vector.<_SafeStr_3151>
        {
            return (null);
        }

        public function get firstProduct():_SafeStr_3151
        {
            return (null);
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
        }

        public function get view():_SafeStr_3133
        {
            return (null);
        }

        public function set grid(_arg_1:IItemGrid):void
        {
        }

        public function setClubIconLevel(_arg_1:int):void
        {
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3300 = "_-51I" (String#4277, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)


