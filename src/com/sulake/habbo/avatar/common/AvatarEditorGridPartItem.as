// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.common.AvatarEditorGridPartItem

package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3177;
    import flash.geom.Rectangle;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.avatar._SafeStr_3164;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3353;

    public class AvatarEditorGridPartItem implements _SafeStr_1875 
    {

        private static var _downloadIcon:BitmapData;
        private static var DRAW_ORDER:Array = [];

        private const THUMB_DIRECTIONS:Array = [2, 6, 0, 4, 3, 1];

        private var _SafeStr_4619:_SafeStr_3301;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _SafeStr_6330:_SafeStr_3177;
        private var _colors:Array;
        private var _useColors:Boolean;
        private var _SafeStr_4617:Boolean = false;
        private var _SafeStr_5214:BitmapData;
        private var _SafeStr_6331:Rectangle;
        private var _SafeStr_6329:int = 0;
        private var _SafeStr_4855:_SafeStr_1701;
        private var _SafeStr_4036:Boolean;
        private var _isDisabledForWearing:Boolean;

        {
            DRAW_ORDER.push("li");
            DRAW_ORDER.push("lh");
            DRAW_ORDER.push("ls");
            DRAW_ORDER.push("lc");
            DRAW_ORDER.push("bd");
            DRAW_ORDER.push("sh");
            DRAW_ORDER.push("lg");
            DRAW_ORDER.push("ch");
            DRAW_ORDER.push("ca");
            DRAW_ORDER.push("cc");
            DRAW_ORDER.push("cp");
            DRAW_ORDER.push("wa");
            DRAW_ORDER.push("rh");
            DRAW_ORDER.push("rs");
            DRAW_ORDER.push("rc");
            DRAW_ORDER.push("hd");
            DRAW_ORDER.push("fc");
            DRAW_ORDER.push("ey");
            DRAW_ORDER.push("hr");
            DRAW_ORDER.push("hrb");
            DRAW_ORDER.push("fa");
            DRAW_ORDER.push("ea");
            DRAW_ORDER.push("ha");
            DRAW_ORDER.push("he");
            DRAW_ORDER.push("ri");
        }

        public function AvatarEditorGridPartItem(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_3301, _arg_3:_SafeStr_3177, _arg_4:Array, _arg_5:Boolean=true, _arg_6:Boolean=false)
        {
            var _local_7:* = null;
            var _local_8:* = null;
            super();
            _SafeStr_4619 = _arg_2;
            _SafeStr_6330 = _arg_3;
            _window = _arg_1;
            _SafeStr_4620 = _window.findChildByTag("BG_COLOR");
            _colors = _arg_4;
            _useColors = _arg_5;
            _isDisabledForWearing = _arg_6;
            if (_arg_3 == null)
            {
                _SafeStr_5214 = new BitmapData(1, 1, true, 0xFFFFFF);
            };
            if (_arg_3 != null)
            {
                _local_8 = _arg_3.parts;
                for each (_local_7 in _local_8)
                {
                    _SafeStr_6329 = Math.max(_SafeStr_6329, _local_7.colorLayerIndex);
                };
            };
            _SafeStr_4855 = _SafeStr_4619.controller.manager.avatarRenderManager;
            _window.addEventListener("WME_OVER", onMouseOver);
            _window.addEventListener("WME_OUT", onMousetOut);
            updateThumbVisualization();
        }

        private function onMousetOut(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4617)
            {
                _SafeStr_4620.visible = false;
            };
            _SafeStr_4620.blend = 1;
        }

        private function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            if (!_SafeStr_4617)
            {
                _SafeStr_4620.visible = true;
                _SafeStr_4620.blend = 0.5;
            };
        }

        public function dispose():void
        {
            if (_SafeStr_4036)
            {
                return;
            };
            _SafeStr_4619 = null;
            _SafeStr_6330 = null;
            if (_window != null)
            {
                if (!_window.disposed)
                {
                    _window.dispose();
                };
            };
            _window = null;
            if (_SafeStr_5214)
            {
                _SafeStr_5214.dispose();
            };
            _SafeStr_5214 = null;
            _SafeStr_4036 = true;
            _downloadIcon = null;
            _SafeStr_4620 = null;
            _SafeStr_6331 = null;
            _SafeStr_4855 = null;
            _SafeStr_4036 = true;
            _colors = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get view():_SafeStr_3133
        {
            return (_window);
        }

        public function get isSelected():Boolean
        {
            return (_SafeStr_4617);
        }

        public function set isSelected(_arg_1:Boolean):void
        {
            _SafeStr_4617 = _arg_1;
            updateThumbVisualization();
        }

        public function get id():int
        {
            if (_SafeStr_6330 == null)
            {
                return (-1);
            };
            return (_SafeStr_6330.id);
        }

        public function get colorLayerCount():int
        {
            return (_SafeStr_6329);
        }

        public function update():void
        {
            updateThumbVisualization();
        }

        public function set iconImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
            updateThumbVisualization();
        }

        public function get partSet():_SafeStr_3177
        {
            return (_SafeStr_6330);
        }

        public function set colors(_arg_1:Array):void
        {
            _colors = _arg_1;
            updateThumbVisualization();
        }

        private function updateThumbVisualization():void
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_6:int;
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            var _local_5:_SafeStr_3264 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            if (_local_5)
            {
                if (((!(_SafeStr_5214 == null)) && (!(_useColors))))
                {
                    _local_1 = _SafeStr_5214;
                }
                else
                {
                    _local_1 = renderThumb();
                    if (!_local_1)
                    {
                        return;
                    };
                };
                _local_3 = ((_local_5.bitmap) ? _local_5.bitmap : new BitmapData(_local_5.width, _local_5.height));
                _local_3.fillRect(_local_3.rect, 0xFFFFFF);
                _local_4 = int(((_local_3.width - _local_1.width) / 2));
                _local_6 = int(((_local_3.height - _local_1.height) / 2));
                _local_3.copyPixels(_local_1, _local_1.rect, new Point(_local_4, _local_6), null, null, true);
                _local_5.bitmap = _local_3;
            };
            var _local_7:_SafeStr_3109 = _window.findChildByTag("CLUB_ICON");
            var _local_2:IStaticBitmapWrapperWindow = (_window.findChildByTag("SELLABLE_ICON") as IStaticBitmapWrapperWindow);
            if (_SafeStr_6330)
            {
                _local_7.visible = (_SafeStr_6330.clubLevel > 0);
                _local_2.visible = _SafeStr_6330.isSellable;
            }
            else
            {
                _local_7.visible = false;
                _local_2.visible = false;
            };
            if (_isDisabledForWearing)
            {
                setAlpha(_local_3, 0.2);
            };
            if (_SafeStr_4620 == null)
            {
                return;
            };
            _SafeStr_4620.visible = _SafeStr_4617;
            _SafeStr_4620.blend = 1;
            _window.invalidate();
        }

        private function analyzePartLayers():Boolean
        {
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_3:* = null;
            if (_SafeStr_4619 == null)
            {
                _SafeStr_6331 = null;
                return (false);
            };
            if ((((!(partSet)) || (!(partSet.parts))) || (partSet.parts.length == 0)))
            {
                _SafeStr_6331 = null;
                return (false);
            };
            if (!_SafeStr_4855)
            {
                return (false);
            };
            var _local_2:_SafeStr_3164 = _SafeStr_4855.createFigureContainer(((partSet.type + "-") + partSet.id));
            if (!_SafeStr_4855.isFigureReady(_local_2))
            {
                _SafeStr_4855.downloadFigure(_local_2, this);
                return (false);
            };
            var _local_8:int;
            var _local_5:Boolean;
            var _local_1:Rectangle = new Rectangle();
            for each (_local_4 in partSet.parts)
            {
                if (_local_5)
                {
                    _local_6 = ((((((("h_std_" + _local_4.type) + "_") + _local_4.id) + "_") + THUMB_DIRECTIONS[_local_8]) + "_") + "0");
                    _local_7 = (_SafeStr_4855.getAssetByName(_local_6) as BitmapDataAsset);
                }
                else
                {
                    _local_8 = 0;
                    while (((!(_local_5)) && (_local_8 < THUMB_DIRECTIONS.length)))
                    {
                        _local_6 = ((((((("h_std_" + _local_4.type) + "_") + _local_4.id) + "_") + THUMB_DIRECTIONS[_local_8]) + "_") + "0");
                        _local_7 = (_SafeStr_4855.getAssetByName(_local_6) as BitmapDataAsset);
                        if (((_local_7) && (_local_7.content)))
                        {
                            _local_5 = true;
                        }
                        else
                        {
                            _local_8++;
                        };
                    };
                };
                if (((_local_7) && (_local_7.content)))
                {
                    _local_3 = (_local_7.content as BitmapData);
                    _local_1 = _local_1.union(new Rectangle((-1 * _local_7.offset.x), (-1 * _local_7.offset.y), _local_7.rectangle.width, _local_7.rectangle.height));
                };
            };
            if (((_local_1) && (_local_1.width > 0)))
            {
                _SafeStr_6331 = _local_1;
                return (true);
            };
            return (false);
        }

        private function renderThumb():BitmapData
        {
            var _local_11:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_10:* = null;
            var _local_12:* = null;
            var _local_1:* = null;
            var _local_7:int;
            var _local_8:int;
            var _local_13:* = null;
            var _local_2:* = null;
            var _local_6:* = null;
            if (partSet == null)
            {
                return (null);
            };
            if (_SafeStr_4619 == null)
            {
                return (null);
            };
            if (_SafeStr_6331 == null)
            {
                if (!analyzePartLayers())
                {
                    if (!_downloadIcon)
                    {
                        _local_11 = _SafeStr_4619.controller.manager.windowManager.assets.getAssetByName("avatar_editor_avatar_editor_download_icon");
                        _downloadIcon = (_local_11.content as BitmapData);
                    };
                    return (_downloadIcon);
                };
            };
            if (!_SafeStr_4855)
            {
                return (null);
            };
            _local_4 = new BitmapData(_SafeStr_6331.width, _SafeStr_6331.height, true, 0xFFFFFF);
            var _local_5:int;
            var _local_9:Boolean;
            var _local_14:Array = partSet.parts.concat().sort(sortByDrawOrder);
            for each (_local_3 in _local_14)
            {
                _local_12 = null;
                if (_local_9)
                {
                    _local_10 = ((((((("h_std_" + _local_3.type) + "_") + _local_3.id) + "_") + THUMB_DIRECTIONS[_local_5]) + "_") + "0");
                    _local_12 = (_SafeStr_4855.getAssetByName(_local_10) as BitmapDataAsset);
                }
                else
                {
                    _local_5 = 0;
                    while (((!(_local_9)) && (_local_5 < THUMB_DIRECTIONS.length)))
                    {
                        _local_10 = ((((((("h_std_" + _local_3.type) + "_") + _local_3.id) + "_") + THUMB_DIRECTIONS[_local_5]) + "_") + "0");
                        _local_12 = (_SafeStr_4855.getAssetByName(_local_10) as BitmapDataAsset);
                        if (((_local_12) && (_local_12.content)))
                        {
                            _local_9 = true;
                        }
                        else
                        {
                            _local_5++;
                        };
                    };
                };
                if (_local_12)
                {
                    _local_1 = BitmapData(_local_12.content);
                    _local_7 = ((-1 * _local_12.offset.x) - _SafeStr_6331.x);
                    _local_8 = ((-1 * _local_12.offset.y) - _SafeStr_6331.y);
                    _local_13 = null;
                    if (((_useColors) && (_local_3.colorLayerIndex > 0)))
                    {
                        _local_2 = _colors[(_local_3.colorLayerIndex - 1)];
                        if (_local_2 != null)
                        {
                            _local_13 = _local_2.colorTransform;
                        };
                    };
                    if (_local_13)
                    {
                        _local_6 = new Rectangle(_local_7, _local_8, _local_12.rectangle.width, _local_12.rectangle.height);
                        _local_4.draw((_local_12.content as BitmapData), new Matrix(1, 0, 0, 1, (-(_local_12.rectangle.x) + _local_7), (-(_local_12.rectangle.y) + _local_8)), _local_13, null, _local_6);
                    }
                    else
                    {
                        _local_4.copyPixels(_local_1, _local_12.rectangle, new Point(_local_7, _local_8), null, null, true);
                    };
                };
            };
            return (_local_4);
        }

        private function setAlpha(_arg_1:BitmapData, _arg_2:Number):BitmapData
        {
            var _local_3:Rectangle = new Rectangle(0, 0, _arg_1.width, _arg_1.height);
            var _local_4:ColorTransform = new ColorTransform();
            _local_4.alphaMultiplier = _arg_2;
            _arg_1.colorTransform(_local_3, _local_4);
            return (_arg_1);
        }

        private function sortByDrawOrder(_arg_1:_SafeStr_3353, _arg_2:_SafeStr_3353):Number
        {
            var _local_3:Number = DRAW_ORDER.indexOf(_arg_1.type);
            var _local_4:Number = DRAW_ORDER.indexOf(_arg_2.type);
            if (_local_3 < _local_4)
            {
                return (-1);
            };
            if (_local_3 > _local_4)
            {
                return (1);
            };
            if (_arg_1.index < _arg_2.index)
            {
                return (-1);
            };
            if (_arg_1.index > _arg_2.index)
            {
                return (1);
            };
            return (0);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (!analyzePartLayers())
            {
                return;
            };
            updateThumbVisualization();
        }

        public function get isDisabledForWearing():Boolean
        {
            return (_isDisabledForWearing);
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3353 = "_-Ye" (String#6452, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)
// _SafeStr_4855 = "_-N1w" (String#3875, DoABC#4)
// _SafeStr_5214 = "_-D1k" (String#2378, DoABC#4)
// _SafeStr_6329 = "_-H1W" (String#14549, DoABC#4)
// _SafeStr_6330 = "_-2L" (String#6779, DoABC#4)
// _SafeStr_6331 = "_-F0" (String#5414, DoABC#4)


