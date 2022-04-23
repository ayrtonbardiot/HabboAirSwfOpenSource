// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.ui.BackgroundViewController

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class BackgroundViewController implements _SafeStr_13 
    {

        private var _disposed:Boolean;
        private var _SafeStr_5466:SnowWarEngine;
        private var _background:_SafeStr_3133;

        public function BackgroundViewController(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            _SafeStr_5466 = null;
            if (_background)
            {
                _background.dispose();
                _background = null;
            };
            _disposed = true;
        }

        public function get background():_SafeStr_3109
        {
            if (!_background)
            {
                createView();
            };
            return (_background);
        }

        private function createView():void
        {
            var _local_1:_SafeStr_3216 = _SafeStr_5466.windowManager.getDesktop(0);
            _background = (WindowUtils.createWindow("snowwar_loading_background_xml", 1) as _SafeStr_3133);
            _background.width = _local_1.width;
            _background.height = _local_1.height;
            _local_1.addChildAt(_background, 0);
            setBitmap("bg_sky", "sky", _background);
            setBitmap("bg_sunshine", "sunshine", _background);
            setBitmap("bg_vista_1", "vista_1", _background, true);
            setBitmap("bg_vista_2", "vista_2", _background, true);
            setBitmap("bg_vista_3", "vista_3", _background, true);
        }

        private function setBitmap(_arg_1:String, _arg_2:String, _arg_3:_SafeStr_3133, _arg_4:Boolean=false):void
        {
            var _local_8:* = null;
            var _local_6:int;
            var _local_9:BitmapDataAsset = (_SafeStr_5466.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            var _local_7:_SafeStr_3264 = (_arg_3.findChildByName(_arg_2) as _SafeStr_3264);
            var _local_5:BitmapData = (_local_9.content as BitmapData);
            if (_arg_4)
            {
                _local_8 = new BitmapData(_arg_3.width, _local_5.height, true, 0);
                _local_6 = 0;
                while (_local_6 < ((_arg_3.width / _local_5.width) + 1))
                {
                    _local_8.copyPixels(_local_5, _local_5.rect, new Point((_local_6 * _local_5.width), 0));
                    _local_6++;
                };
                _local_7.bitmap = _local_8;
            }
            else
            {
                _local_7.bitmap = _local_5;
                _local_7.disposesBitmap = false;
            };
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)


