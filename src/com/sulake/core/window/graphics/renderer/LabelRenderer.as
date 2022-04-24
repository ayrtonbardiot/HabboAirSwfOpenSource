// by nota

//com.sulake.core.window.graphics.renderer.LabelRenderer

package com.sulake.core.window.graphics.renderer
{
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import com.sulake.core.window.utils._SafeStr_3350;
    import flash.text.TextField;
    import com.sulake.core.window.components.TextLabelController;
    import com.sulake.core.window.utils.TextFieldCache;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class LabelRenderer extends SkinRenderer 
    {

        private static const _SafeStr_6344:ColorTransform = new ColorTransform(0, 0, 0, 1, 0xFF, 0xFF, 0xFF, 0);

        protected var _SafeStr_5956:Matrix;
        protected var _SafeStr_6342:_SafeStr_3350;
        protected var _SafeStr_6343:TextField;

        public function LabelRenderer(_arg_1:String)
        {
            super(_arg_1);
            _SafeStr_5956 = new Matrix();
        }

        override public function draw(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_9:* = null;
            var _local_6:uint;
            var _local_7:* = null;
            var _local_10:* = null;
            if (_arg_2 != null)
            {
                _local_9 = TextLabelController(_arg_1);
                var _local_8:_SafeStr_3350 = _local_9.textStyle;
                if (_local_8 != _SafeStr_6342)
                {
                    _SafeStr_6343 = TextFieldCache.getTextFieldByStyle(_local_8);
                    _SafeStr_6342 = _local_8;
                };
                _SafeStr_5956.tx = _local_9.drawOffsetX;
                _SafeStr_5956.ty = _local_9.drawOffsetY;
                _SafeStr_6343.text = _local_9.text;
                _local_6 = _local_8.color;
                _SafeStr_6343.textColor = ((_local_9.hasTextColor) ? _local_9.textColor : _local_6);
                _SafeStr_6343.antiAliasType = "advanced";
                _SafeStr_6343.gridFitType = "pixel";
                if (_local_9.vertical)
                {
                    _SafeStr_5956.a = 0;
                    _SafeStr_5956.b = -1;
                    _SafeStr_5956.c = 1;
                    _SafeStr_5956.d = 0;
                    _SafeStr_5956.ty = (_SafeStr_5956.ty + _local_9.height);
                };
                if ((_local_8.etchingColor & 0xFF000000) != 0)
                {
                    _SafeStr_6344.redOffset = ((_local_8.etchingColor >> 16) & 0xFF);
                    _SafeStr_6344.greenOffset = ((_local_8.etchingColor >> 8) & 0xFF);
                    _SafeStr_6344.blueOffset = (_local_8.etchingColor & 0xFF);
                    _local_7 = ETCHING_POSITION[_local_8.etchingPosition];
                    if (_local_7 != null)
                    {
                        if (_local_9.vertical)
                        {
                            _SafeStr_5956.tx = (_SafeStr_5956.tx + _local_7.y);
                            _SafeStr_5956.ty = (_SafeStr_5956.ty - _local_7.x);
                            _arg_2.draw(_SafeStr_6343, _SafeStr_5956, _SafeStr_6344, null, null, false);
                            _SafeStr_5956.tx = (_SafeStr_5956.tx - _local_7.y);
                            _SafeStr_5956.ty = (_SafeStr_5956.ty + _local_7.x);
                        }
                        else
                        {
                            _SafeStr_5956.tx = (_SafeStr_5956.tx + _local_7.x);
                            _SafeStr_5956.ty = (_SafeStr_5956.ty + _local_7.y);
                            _arg_2.draw(_SafeStr_6343, _SafeStr_5956, _SafeStr_6344, null, null, false);
                            _SafeStr_5956.tx = (_SafeStr_5956.tx - _local_7.x);
                            _SafeStr_5956.ty = (_SafeStr_5956.ty - _local_7.y);
                        };
                    };
                };
                if (_arg_1.dynamicStyleColor)
                {
                    _local_10 = _arg_1.dynamicStyleColor;
                };
                _arg_2.draw(_SafeStr_6343, _SafeStr_5956, _local_10, null, null, false);
                if (_local_9.vertical)
                {
                    _SafeStr_5956.a = 1;
                    _SafeStr_5956.b = 0;
                    _SafeStr_5956.c = 0;
                    _SafeStr_5956.d = 1;
                    _SafeStr_5956.ty = (_SafeStr_5956.ty - _local_9.height);
                };
                _SafeStr_6343.textColor = _local_6;
            };
        }

        override public function isStateDrawable(_arg_1:uint):Boolean
        {
            return (_arg_1 == 0);
        }


    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3350 = "_-O1m" (String#1615, DoABC#4)
// _SafeStr_5956 = "_-Q1J" (String#1484, DoABC#4)
// _SafeStr_6342 = "_-WJ" (String#19302, DoABC#4)
// _SafeStr_6343 = "_-hz" (String#6612, DoABC#4)
// _SafeStr_6344 = "_-L1V" (String#4604, DoABC#4)


