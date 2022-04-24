// by nota

//com.sulake.habbo.catalog.viewer.BundleProductContainer

package com.sulake.habbo.catalog.viewer
{
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;

    public class BundleProductContainer extends ProductContainer implements IItemGrid 
    {

        private var _bundleIcon:BitmapData;

        public function BundleProductContainer(_arg_1:_SafeStr_3141, _arg_2:Vector.<_SafeStr_3151>, _arg_3:HabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3);
            var _local_4:BitmapDataAsset = (_arg_3.assets.getAssetByName("ctlg_pic_deal_icon_narrow") as BitmapDataAsset);
            if (_local_4 != null)
            {
                _bundleIcon = (_local_4.content as BitmapData);
            }
            else
            {
                _bundleIcon = new BitmapData(1, 1, true, 0xFFFFFF);
            };
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _bundleIcon = null;
            super.dispose();
        }

        override public function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void
        {
            setIconImage(_bundleIcon.clone(), true);
        }

        public function populateItemGrid(_arg_1:IItemGridWindow, _arg_2:XML):void
        {
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_4:_SafeStr_3133 = (catalog.windowManager.buildFromXML(_arg_2) as _SafeStr_3133);
            for each (var _local_5:_SafeStr_3151 in offer.productContainer.products)
            {
                if (_local_5.productType != "b")
                {
                    _local_7 = (_local_4.clone() as _SafeStr_3133);
                    _local_3 = _local_7.findChildByName("clubLevelIcon");
                    if (_local_3 != null)
                    {
                        _local_3.visible = false;
                    };
                    _arg_1.addGridItem(_local_7);
                    _local_5.view = _local_7;
                    _local_6 = _local_5.initIcon(this);
                    if (_local_6 != null)
                    {
                        _local_6.dispose();
                    };
                    _local_5.grid = this;
                };
            };
        }

        public function setBundleCounter(_arg_1:int):void
        {
            var _local_2:_SafeStr_3109 = (_SafeStr_3882.findChildByName("bundleCounter") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.caption = _arg_1.toString();
            };
        }

        public function select(_arg_1:_SafeStr_3266, _arg_2:Boolean):void
        {
            _SafeStr_14.log(("Product Bundle, select item: " + _arg_1));
        }

        public function startDragAndDrop(_arg_1:_SafeStr_3266):Boolean
        {
            return (false);
        }

        override public function set view(_arg_1:_SafeStr_3133):void
        {
            super.view = _arg_1;
            setBundleCounter(999);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)


