// by nota

//com.sulake.habbo.ui.widget.furniture.dimmer.DimmerViewColorGrid

package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;

    public class DimmerViewColorGrid 
    {

        private var _SafeStr_6755:IItemGridWindow;
        private var _SafeStr_3882:DimmerView;
        private var _colorCellXML:XML;
        private var _colorCellFrame:BitmapData;
        private var _colorCellButton:BitmapData;
        private var _SafeStr_6756:BitmapData;
        private var _SafeStr_5575:_SafeStr_3133;

        public function DimmerViewColorGrid(_arg_1:DimmerView, _arg_2:IItemGridWindow, _arg_3:_SafeStr_1695, _arg_4:_SafeStr_21)
        {
            _SafeStr_3882 = _arg_1;
            _SafeStr_6755 = _arg_2;
            storeAssets(_arg_4);
            populate(_arg_3);
        }

        public function dispose():void
        {
            _SafeStr_3882 = null;
            _SafeStr_6755 = null;
            _colorCellXML = null;
            _colorCellFrame = null;
            _colorCellButton = null;
            _SafeStr_6756 = null;
        }

        public function setSelectedColorIndex(_arg_1:int):void
        {
            if (_SafeStr_6755 == null)
            {
                return;
            };
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_6755.numGridItems)))
            {
                return;
            };
            select((_SafeStr_6755.getGridItemAt(_arg_1) as _SafeStr_3133));
        }

        private function populate(_arg_1:_SafeStr_1695):void
        {
            if (((_SafeStr_3882 == null) || (_SafeStr_6755 == null)))
            {
                return;
            };
            populateColourGrid(_arg_1);
        }

        private function select(_arg_1:_SafeStr_3133):void
        {
            var _local_2:* = null;
            if (_SafeStr_5575 != null)
            {
                _local_2 = _SafeStr_5575.getChildByName("chosen");
                if (_local_2 != null)
                {
                    _local_2.visible = false;
                };
            };
            _SafeStr_5575 = _arg_1;
            _local_2 = _SafeStr_5575.getChildByName("chosen");
            if (_local_2 != null)
            {
                _local_2.visible = true;
            };
        }

        private function populateColourGrid(_arg_1:_SafeStr_1695):void
        {
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_14:* = null;
            var _local_11:uint;
            var _local_3:uint;
            var _local_2:uint;
            var _local_7:Number;
            var _local_12:Number;
            var _local_5:Number;
            var _local_13:* = null;
            var _local_6:* = null;
            var _local_9:* = null;
            _SafeStr_6755.destroyGridItems();
            _SafeStr_5575 = null;
            for each (var _local_10:uint in colors)
            {
                _local_4 = (_arg_1.buildFromXML(_colorCellXML) as _SafeStr_3133);
                _local_4.addEventListener("WME_CLICK", onClick);
                _local_4.background = true;
                _local_4.color = 0xFFFFFFFF;
                _local_4.width = _colorCellFrame.width;
                _local_4.height = _colorCellFrame.height;
                _SafeStr_6755.addGridItem(_local_4);
                _local_8 = (_local_4.findChildByTag("BG_BORDER") as _SafeStr_3264);
                if (_local_8 != null)
                {
                    _local_8.bitmap = new BitmapData(_colorCellFrame.width, _colorCellFrame.height, true, 0);
                    _local_8.bitmap.copyPixels(_colorCellFrame, _colorCellFrame.rect, new Point(0, 0));
                };
                _local_14 = (_local_4.findChildByTag("COLOR_IMAGE") as _SafeStr_3264);
                if (_local_14 != null)
                {
                    _local_14.bitmap = new BitmapData(_colorCellButton.width, _colorCellButton.height, true, 0);
                    _local_11 = ((_local_10 >> 16) & 0xFF);
                    _local_3 = ((_local_10 >> 8) & 0xFF);
                    _local_2 = ((_local_10 >> 0) & 0xFF);
                    _local_7 = ((_local_11 / 0xFF) * 1);
                    _local_12 = ((_local_3 / 0xFF) * 1);
                    _local_5 = ((_local_2 / 0xFF) * 1);
                    _local_13 = new ColorTransform(_local_7, _local_12, _local_5);
                    _local_6 = _colorCellButton.clone();
                    _local_6.colorTransform(_local_6.rect, _local_13);
                    _local_14.bitmap.copyPixels(_local_6, _local_6.rect, new Point(0, 0));
                };
                _local_9 = (_local_4.findChildByTag("COLOR_CHOSEN") as _SafeStr_3264);
                if (_local_9 != null)
                {
                    _local_9.bitmap = new BitmapData(_SafeStr_6756.width, _SafeStr_6756.height, true, 0xFFFFFF);
                    _local_9.bitmap.copyPixels(_SafeStr_6756, _SafeStr_6756.rect, new Point(0, 0), null, null, true);
                    _local_9.visible = false;
                };
            };
        }

        private function onClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int = _SafeStr_6755.getGridItemIndex((_arg_1.target as _SafeStr_3109));
            setSelectedColorIndex(_local_2);
            _SafeStr_3882.selectedColorIndex = _local_2;
        }

        private function storeAssets(_arg_1:_SafeStr_21):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _local_2 = XmlAsset(_arg_1.getAssetByName("dimmer_color_chooser_cell"));
            _colorCellXML = XML(_local_2.content);
            _local_3 = BitmapDataAsset(_arg_1.getAssetByName("dimmer_color_frame"));
            _colorCellFrame = BitmapData(_local_3.content);
            _local_3 = BitmapDataAsset(_arg_1.getAssetByName("dimmer_color_button"));
            _colorCellButton = BitmapData(_local_3.content);
            _local_3 = BitmapDataAsset(_arg_1.getAssetByName("dimmer_color_selected"));
            _SafeStr_6756 = BitmapData(_local_3.content);
        }

        private function get colors():Array
        {
            if (_SafeStr_3882 == null)
            {
                return ([]);
            };
            return (_SafeStr_3882.colors);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.dimmer

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_5575 = "_-c4" (String#1493, DoABC#4)
// _SafeStr_6755 = "_-Z10" (String#6232, DoABC#4)
// _SafeStr_6756 = "_-H1v" (String#8407, DoABC#4)


