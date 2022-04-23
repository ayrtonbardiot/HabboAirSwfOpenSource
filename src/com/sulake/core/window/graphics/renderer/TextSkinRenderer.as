// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.graphics.renderer.TextSkinRenderer

package com.sulake.core.window.graphics.renderer
{
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import com.sulake.core.window.utils._SafeStr_3371;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.utils.ITextFieldContainer;
    import com.sulake.core.window.components.ITextWindow;
    import flash.text.TextField;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class TextSkinRenderer extends SkinRenderer 
    {

        private static const _SafeStr_6344:ColorTransform = new ColorTransform(0, 0, 0, 1, 0xFF, 0xFF, 0xFF, 0);

        protected var _SafeStr_5956:Matrix;

        public function TextSkinRenderer(_arg_1:String)
        {
            super(_arg_1);
            _SafeStr_5956 = new Matrix();
        }

        override public function parse(_arg_1:IAsset, _arg_2:XMLList, _arg_3:_SafeStr_21):void
        {
            var _local_4:String = _arg_1.content.toString();
            _SafeStr_3371.setStyles(_SafeStr_3371.parseCSS(_local_4));
        }

        override public function draw(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_7:* = null;
            var _local_9:* = null;
            var _local_11:* = null;
            if (_arg_2 != null)
            {
                _local_7 = ITextFieldContainer(_arg_1);
                var _local_10:ITextWindow = ITextWindow(_arg_1);
                var _local_6:String = _local_10.autoSize;
                var _local_8:TextField = _local_7.textField;
                _SafeStr_5956.tx = _local_7.margins.left;
                _SafeStr_5956.ty = _local_7.margins.top;
                if (_local_6 == "right")
                {
                    _SafeStr_5956.tx = Math.floor((_arg_1.width - _local_8.width));
                }
                else
                {
                    if (_local_6 == "center")
                    {
                        _SafeStr_5956.tx = Math.floor(((_arg_1.width / 2) - (_local_8.width / 2)));
                    };
                };
                if ((_local_10.etchingColor & 0xFF000000) != 0)
                {
                    _SafeStr_6344.redOffset = ((_local_10.etchingColor >> 16) & 0xFF);
                    _SafeStr_6344.greenOffset = ((_local_10.etchingColor >> 8) & 0xFF);
                    _SafeStr_6344.blueOffset = (_local_10.etchingColor & 0xFF);
                    _SafeStr_6344.alphaMultiplier = (((_local_10.etchingColor >> 24) & 0xFF) / 0xFF);
                    _local_9 = ETCHING_POSITION[_local_10.etchingPosition];
                    if (_local_9 != null)
                    {
                        _SafeStr_5956.tx = (_SafeStr_5956.tx + _local_9.x);
                        _SafeStr_5956.ty = (_SafeStr_5956.ty + _local_9.y);
                        _arg_2.draw(_local_8, _SafeStr_5956, _SafeStr_6344, null, null, false);
                        _SafeStr_5956.tx = (_SafeStr_5956.tx - _local_9.x);
                        _SafeStr_5956.ty = (_SafeStr_5956.ty - _local_9.y);
                    };
                };
                if (_arg_1.dynamicStyleColor)
                {
                    _local_11 = _arg_1.dynamicStyleColor;
                };
                _arg_2.draw(_local_8, _SafeStr_5956, _local_11, null, null, false);
            };
        }

        override public function isStateDrawable(_arg_1:uint):Boolean
        {
            return (_arg_1 == 0);
        }


    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3371 = "_-b2" (String#2781, DoABC#4)
// _SafeStr_5956 = "_-Q1J" (String#1484, DoABC#4)
// _SafeStr_6344 = "_-L1V" (String#4604, DoABC#4)


