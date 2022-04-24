// by nota

//com.sulake.habbo.window.widgets.IlluminaBorderWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import flash.geom.Matrix;
    import flash.utils.Dictionary;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;

    public class IlluminaBorderWidget implements IIlluminaBorderWidget 
    {

        public static const TYPE:String = "illumina_border";
        public static const BORDER_STYLE_ILLUMINA_LIGHT:String = "illumina_light";
        public static const BORDER_STYLE_ILLUMINA_DARK:String = "illumina_dark";
        public static const BORDER_STYLES:Array = ["illumina_light", "illumina_dark"];
        public static const BORDER_STYLE_KEY:String = "illumina_border:border_style";
        private static const CONTENT_CHILD_KEY:String = "illumina_border:content_child";
        private static const CONTENT_PADDING_KEY:String = "illumina_border:content_padding";
        private static const SIDE_PADDING_KEY:String = "illumina_border:side_padding";
        private static const CHILD_MARGIN_KEY:String = "illumina_border:child_margin";
        private static const TOP_LEFT_CHILD_KEY:String = "illumina_border:top_left_child";
        private static const TOP_CENTER_CHILD_KEY:String = "illumina_border:top_center_child";
        private static const TOP_RIGHT_CHILD_KEY:String = "illumina_border:top_right_child";
        private static const BOTTOM_LEFT_CHILD_KEY:String = "illumina_border:bottom_left_child";
        private static const BOTTOM_CENTER_CHILD_KEY:String = "illumina_border:bottom_center_child";
        private static const BOTTOM_RIGHT_CHILD_KEY:String = "illumina_border:bottom_right_child";
        private static const LANDING_VIEW_MODE_KEY:String = "illumina_border:landing_view_mode";
        private static const CONTENT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:content_child", "", "String");
        private static const CONTENT_PADDING_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:content_padding", 5, "uint");
        private static const SIDE_PADDING_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:side_padding", 15, "uint");
        private static const CHILD_MARGIN_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:child_margin", 3, "uint");
        private static const TOP_LEFT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_left_child", "", "String");
        private static const TOP_CENTER_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_center_child", "", "String");
        private static const TOP_RIGHT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:top_right_child", "", "String");
        private static const BOTTOM_LEFT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_left_child", "", "String");
        private static const BOTTOM_CENTER_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_center_child", "", "String");
        private static const BOTTOM_RIGHT_CHILD_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:bottom_right_child", "", "String");
        private static const LANDING_VIEW_MODE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_border:landing_view_mode", false, "Boolean");
        private static const MATRIX:Matrix = new Matrix();
        private static const TOP_LEFT:String = "top_left";
        private static const TOP:String = "top_center";
        private static const TOP_RIGHT:String = "top_right";
        private static const RIGHT:String = "center_right";
        private static const BOTTOM_RIGHT:String = "bottom_right";
        private static const BOTTOM:String = "bottom_center";
        private static const BOTTOM_LEFT:String = "bottom_left";
        private static const _SafeStr_8170:String = "center_left";
        private static const BORDER_PIECES:Array = ["top_left", "top_center", "top_right", "center_right", "bottom_right", "bottom_center", "bottom_left", "center_left"];

        private var _SafeStr_6159:Dictionary;
        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5234:_SafeStr_3264;
        private var _SafeStr_5675:BitmapData;
        private var _children:_SafeStr_3133;
        private var _SafeStr_5890:Boolean = false;
        private var _SafeStr_5891:Boolean = false;
        private var _SafeStr_6148:String;
        private var _SafeStr_6149:String = CONTENT_CHILD_DEFAULT.value;
        private var _SafeStr_6150:uint = CONTENT_PADDING_DEFAULT.value;
        private var _SafeStr_6151:uint = SIDE_PADDING_DEFAULT.value;
        private var _childMargin:uint = CHILD_MARGIN_DEFAULT.value;
        private var _SafeStr_6152:String = TOP_LEFT_CHILD_DEFAULT.value;
        private var _SafeStr_6153:String = TOP_CENTER_CHILD_DEFAULT.value;
        private var _SafeStr_6154:String = TOP_RIGHT_CHILD_DEFAULT.value;
        private var _SafeStr_6155:String = BOTTOM_LEFT_CHILD_DEFAULT.value;
        private var _SafeStr_6156:String = BOTTOM_CENTER_CHILD_DEFAULT.value;
        private var _SafeStr_6157:String = BOTTOM_RIGHT_CHILD_DEFAULT.value;
        private var _SafeStr_6158:Boolean = LANDING_VIEW_MODE_DEFAULT.value;

        public function IlluminaBorderWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("illumina_border_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_5234 = (_SafeStr_5428.getChildByName("canvas") as _SafeStr_3264);
            _children = (_SafeStr_5428.getChildByName("children") as _SafeStr_3133);
            borderStyle = _SafeStr_5427.getDefaultProperty("illumina_border:border_style").value;
            _SafeStr_5427.addEventListener("WE_RESIZE", onChange);
            _SafeStr_5427.addEventListener("WE_RESIZED", onChange);
            _children.addEventListener("WE_CHILD_ADDED", onChange);
            _children.addEventListener("WE_CHILD_REMOVED", onChange);
            _children.addEventListener("WE_CHILD_RELOCATED", onChange);
            _children.addEventListener("WE_CHILD_RESIZED", onChange);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        private function onChange(_arg_1:_SafeStr_3116):void
        {
            refresh();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5675 != null)
                {
                    _SafeStr_5675.dispose();
                    _SafeStr_5675 = null;
                };
                if (_SafeStr_5234 != null)
                {
                    _SafeStr_5234.removeEventListener("WE_RESIZE", onChange);
                    _SafeStr_5234.removeEventListener("WE_RESIZED", onChange);
                    _SafeStr_5234 = null;
                };
                if (_children != null)
                {
                    _children.removeEventListener("WE_CHILD_ADDED", onChange);
                    _children.removeEventListener("WE_CHILD_REMOVED", onChange);
                    _children.removeEventListener("WE_CHILD_RELOCATED", onChange);
                    _children.removeEventListener("WE_CHILD_RESIZED", onChange);
                    _children = null;
                };
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _SafeStr_6159 = null;
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (_children.iterator);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(_SafeStr_5427.createProperty("illumina_border:border_style", _SafeStr_6148));
            _local_1.push(CONTENT_CHILD_DEFAULT.withValue(_SafeStr_6149));
            _local_1.push(CONTENT_PADDING_DEFAULT.withValue(_SafeStr_6150));
            _local_1.push(SIDE_PADDING_DEFAULT.withValue(_SafeStr_6151));
            _local_1.push(CHILD_MARGIN_DEFAULT.withValue(_childMargin));
            _local_1.push(TOP_LEFT_CHILD_DEFAULT.withValue(_SafeStr_6152));
            _local_1.push(TOP_CENTER_CHILD_DEFAULT.withValue(_SafeStr_6153));
            _local_1.push(TOP_RIGHT_CHILD_DEFAULT.withValue(_SafeStr_6154));
            _local_1.push(BOTTOM_LEFT_CHILD_DEFAULT.withValue(_SafeStr_6155));
            _local_1.push(BOTTOM_CENTER_CHILD_DEFAULT.withValue(_SafeStr_6156));
            _local_1.push(BOTTOM_RIGHT_CHILD_DEFAULT.withValue(_SafeStr_6157));
            _local_1.push(LANDING_VIEW_MODE_DEFAULT.withValue(_SafeStr_6158));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            _SafeStr_5890 = true;
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "illumina_border:border_style":
                        borderStyle = _local_2.value;
                        break;
                    case "illumina_border:content_child":
                        contentChild = _local_2.value;
                        break;
                    case "illumina_border:content_padding":
                        contentPadding = _local_2.value;
                        break;
                    case "illumina_border:side_padding":
                        sidePadding = _local_2.value;
                        break;
                    case "illumina_border:child_margin":
                        childMargin = _local_2.value;
                        break;
                    case "illumina_border:top_left_child":
                        topLeftChild = _local_2.value;
                        break;
                    case "illumina_border:top_center_child":
                        topCenterChild = _local_2.value;
                        break;
                    case "illumina_border:top_right_child":
                        topRightChild = _local_2.value;
                        break;
                    case "illumina_border:bottom_left_child":
                        bottomLeftChild = _local_2.value;
                        break;
                    case "illumina_border:bottom_center_child":
                        bottomCenterChild = _local_2.value;
                        break;
                    case "illumina_border:bottom_right_child":
                        bottomRightChild = _local_2.value;
                        break;
                    case "illumina_border:landing_view_mode":
                        landingViewMode = _local_2.value;
                };
            };
            _SafeStr_5890 = false;
            refresh();
        }

        public function get borderStyle():String
        {
            return (_SafeStr_6148);
        }

        public function set borderStyle(_arg_1:String):void
        {
            _SafeStr_6148 = _arg_1;
            _SafeStr_6159 = new Dictionary();
            for each (var _local_2:String in BORDER_PIECES)
            {
                _SafeStr_6159[_local_2] = _windowManager.assets.getAssetByName(((_SafeStr_6148 + "_border_") + _local_2));
            };
            refresh();
        }

        public function get contentChild():String
        {
            return (_SafeStr_6149);
        }

        public function set contentChild(_arg_1:String):void
        {
            _SafeStr_6149 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get contentPadding():uint
        {
            return (_SafeStr_6150);
        }

        public function set contentPadding(_arg_1:uint):void
        {
            _SafeStr_6150 = _arg_1;
            refresh();
        }

        public function get sidePadding():uint
        {
            return (_SafeStr_6151);
        }

        public function set sidePadding(_arg_1:uint):void
        {
            _SafeStr_6151 = _arg_1;
            refresh();
        }

        public function get childMargin():uint
        {
            return (_childMargin);
        }

        public function set childMargin(_arg_1:uint):void
        {
            _childMargin = _arg_1;
            refresh();
        }

        public function get topLeftChild():String
        {
            return (_SafeStr_6152);
        }

        public function set topLeftChild(_arg_1:String):void
        {
            _SafeStr_6152 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get topCenterChild():String
        {
            return (_SafeStr_6153);
        }

        public function set topCenterChild(_arg_1:String):void
        {
            _SafeStr_6153 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get topRightChild():String
        {
            return (_SafeStr_6154);
        }

        public function set topRightChild(_arg_1:String):void
        {
            _SafeStr_6154 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get bottomLeftChild():String
        {
            return (_SafeStr_6155);
        }

        public function set bottomLeftChild(_arg_1:String):void
        {
            _SafeStr_6155 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get bottomCenterChild():String
        {
            return (_SafeStr_6156);
        }

        public function set bottomCenterChild(_arg_1:String):void
        {
            _SafeStr_6156 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get bottomRightChild():String
        {
            return (_SafeStr_6157);
        }

        public function set bottomRightChild(_arg_1:String):void
        {
            _SafeStr_6157 = ((_arg_1 != null) ? _arg_1 : "");
            refresh();
        }

        public function get landingViewMode():Boolean
        {
            return (_SafeStr_6158);
        }

        public function set landingViewMode(_arg_1:Boolean):void
        {
            _SafeStr_6158 = _arg_1;
            refresh();
        }

        private function getPiece(_arg_1:String):BitmapDataAsset
        {
            return (_SafeStr_6159[_arg_1]);
        }

        private function getChildHeight(_arg_1:String):int
        {
            var _local_2:_SafeStr_3109 = _children.getChildByName(_arg_1);
            return ((((!(_arg_1 == null)) && (_arg_1.length > 0)) && (!(_local_2 == null))) ? _local_2.height : 0);
        }

        private function get topPadding():int
        {
            return (Math.max(getChildHeight(_SafeStr_6153), Math.max(getChildHeight(_SafeStr_6152), getChildHeight(_SafeStr_6154))) / 2);
        }

        private function get bottomPadding():int
        {
            return (Math.max(getChildHeight(_SafeStr_6156), Math.max(getChildHeight(_SafeStr_6155), getChildHeight(_SafeStr_6157))) / 2);
        }

        private function refresh():void
        {
            var _local_3:int;
            var _local_9:int;
            var _local_10:* = null;
            var _local_6:* = null;
            var _local_13:* = null;
            var _local_4:* = null;
            var _local_1:int;
            var _local_8:int;
            if ((((_SafeStr_5890) || (_SafeStr_5891)) || (disposed)))
            {
                return;
            };
            _SafeStr_5428.limits.setEmpty();
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
            var _local_2:_SafeStr_3109 = _children.getChildByName(_SafeStr_6149);
            if (_local_2 != null)
            {
                _local_3 = Math.max(1, (_local_2.width + (2 * _SafeStr_6150)));
                _local_9 = Math.max(1, (((_local_2.height + (2 * _SafeStr_6150)) + topPadding) + bottomPadding));
                _SafeStr_5891 = true;
                if (_SafeStr_5427.testParamFlag(0x20000))
                {
                    _SafeStr_5428.limits.minWidth = _local_3;
                    _SafeStr_5428.limits.minHeight = _local_9;
                };
                if (_SafeStr_5427.testParamFlag(147456))
                {
                    _SafeStr_5428.limits.minWidth = _local_3;
                    _SafeStr_5428.limits.minHeight = _local_9;
                    _SafeStr_5428.limits.maxWidth = _local_3;
                    _SafeStr_5428.limits.maxHeight = _local_9;
                };
                _SafeStr_5891 = false;
            };
            if ((((_SafeStr_5675 == null) || (!(_SafeStr_5675.width == _SafeStr_5428.width))) || (!(_SafeStr_5675.height == _SafeStr_5428.height))))
            {
                _SafeStr_5234.width = _SafeStr_5428.width;
                _SafeStr_5234.height = _SafeStr_5428.height;
                _children.width = _SafeStr_5428.width;
                _children.height = _SafeStr_5428.height;
                if (_SafeStr_5675 != null)
                {
                    _SafeStr_5675.dispose();
                };
                _SafeStr_5675 = new BitmapData(_SafeStr_5234.width, _SafeStr_5234.height, true, 0);
                _SafeStr_5234.bitmap = _SafeStr_5675;
            };
            var _local_12:Rectangle = _SafeStr_5234.rectangle;
            _local_12.y = (_local_12.y + topPadding);
            _local_12.height = (_local_12.height - (topPadding + bottomPadding));
            _SafeStr_5675.lock();
            _SafeStr_5675.fillRect(new Rectangle(0, 0, _SafeStr_5234.width, _SafeStr_5234.height), 0);
            _loop_1:
            for (var _local_5:String in _SafeStr_6159)
            {
                _local_10 = getPiece(_local_5);
                if (!((_local_10 == null) || ((_SafeStr_6158) && (((_local_5 == "top_left") || (_local_5 == "center_left")) || (_local_5 == "bottom_left")))))
                {
                    _local_6 = (_local_10.content as BitmapData);
                    _local_13 = _local_10.rectangle;
                    _local_4 = new Rectangle(_local_12.x, _local_12.y, _local_13.width, _local_13.height);
                    switch (_local_5)
                    {
                        case "top_left":
                            break;
                        case "top_center":
                            _local_4.x = (_local_4.x + getPiece("top_left").rectangle.width);
                            _local_4.width = ((_local_12.width - getPiece("top_left").rectangle.width) - getPiece("top_right").rectangle.width);
                            break;
                        case "top_right":
                            _local_4.x = (_local_4.x + (_local_12.width - _local_13.width));
                            break;
                        case "center_right":
                            _local_4.x = (_local_4.x + (_local_12.width - _local_13.width));
                            _local_4.y = (_local_4.y + getPiece("top_right").rectangle.height);
                            _local_4.height = ((_local_12.height - getPiece("top_right").rectangle.height) - getPiece("bottom_right").rectangle.height);
                            break;
                        case "bottom_right":
                            _local_4.x = (_local_4.x + (_local_12.width - _local_13.width));
                            _local_4.y = (_local_4.y + (_local_12.height - _local_13.height));
                            break;
                        case "bottom_center":
                            _local_4.x = (_local_4.x + getPiece("bottom_left").rectangle.width);
                            _local_4.y = (_local_4.y + (_local_12.height - _local_13.height));
                            _local_4.width = ((_local_12.width - getPiece("bottom_left").rectangle.width) - getPiece("bottom_right").rectangle.width);
                            if (_SafeStr_6158)
                            {
                                _local_1 = int((_local_4.width / 2));
                                _local_4.x = (_local_4.x + _local_1);
                                _local_4.width = (_local_4.width - _local_1);
                            };
                            break;
                        case "bottom_left":
                            _local_4.y = (_local_4.y + (_local_12.height - _local_13.height));
                            break;
                        case "center_left":
                            _local_4.y = (_local_4.y + getPiece("top_left").rectangle.height);
                            _local_4.height = ((_local_12.height - getPiece("top_left").rectangle.height) - getPiece("bottom_left").rectangle.height);
                            break;
                        default:
                            continue _loop_1;
                    };
                    MATRIX.a = (_local_4.width / _local_13.width);
                    MATRIX.d = (_local_4.height / _local_13.height);
                    MATRIX.tx = (_local_4.x - (_local_13.x * MATRIX.a));
                    MATRIX.ty = (_local_4.y - (_local_13.y * MATRIX.d));
                    _SafeStr_5675.draw(_local_6, MATRIX, null, null, _local_4, false);
                };
            };
            var _local_11:Array = [_SafeStr_6152, _SafeStr_6153, _SafeStr_6154, _SafeStr_6155, _SafeStr_6156, _SafeStr_6157];
            for each (var _local_7:_SafeStr_3109 in _children.iterator)
            {
                if (((!(_local_7.name == null)) && (_local_7.name.length > 0)))
                {
                    _local_8 = _local_11.indexOf(_local_7.name);
                    if (_local_8 < 0)
                    {
                        if (_local_7.name == _SafeStr_6149)
                        {
                            _local_7.x = (_local_12.x + contentPadding);
                            _local_7.y = (_local_12.y + contentPadding);
                            _local_7.visible = true;
                        }
                        else
                        {
                            _local_7.visible = false;
                        };
                    }
                    else
                    {
                        switch ((_local_8 % 3))
                        {
                            case 0:
                                _local_7.x = Math.min(_SafeStr_6151, (_SafeStr_5234.width - _local_7.width));
                                break;
                            case 1:
                                _local_7.x = (Math.max((_SafeStr_5234.width - _local_7.width), 0) / 2);
                                break;
                            case 2:
                                _local_7.x = Math.max(((_SafeStr_5234.width - _local_7.width) - _SafeStr_6151), 0);
                        };
                        if (_local_8 < 3)
                        {
                            _local_7.y = (topPadding - (_local_7.height / 2));
                        }
                        else
                        {
                            _local_7.y = (_SafeStr_5234.height - (bottomPadding + (_local_7.height / 2)));
                        };
                        _local_7.visible = true;
                        _SafeStr_5675.fillRect(new Rectangle((_local_7.x - _childMargin), _local_7.y, (_local_7.width + (_childMargin * 2)), _local_7.height), 0);
                    };
                }
                else
                {
                    _local_7.visible = false;
                };
            };
            _SafeStr_5675.unlock();
            _SafeStr_5234.invalidate();
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5675 = "_-3" (String#2348, DoABC#4)
// _SafeStr_5890 = "_-MV" (String#5995, DoABC#4)
// _SafeStr_5891 = "_-31Z" (String#3940, DoABC#4)
// _SafeStr_6148 = "_-dV" (String#13580, DoABC#4)
// _SafeStr_6149 = "_-5a" (String#8331, DoABC#4)
// _SafeStr_6150 = "_-RR" (String#7902, DoABC#4)
// _SafeStr_6151 = "_-90" (String#8275, DoABC#4)
// _SafeStr_6152 = "_-71O" (String#8016, DoABC#4)
// _SafeStr_6153 = "_-6F" (String#8332, DoABC#4)
// _SafeStr_6154 = "_-O1U" (String#8464, DoABC#4)
// _SafeStr_6155 = "_-bs" (String#8657, DoABC#4)
// _SafeStr_6156 = "_-L1T" (String#8536, DoABC#4)
// _SafeStr_6157 = "_-A1I" (String#8575, DoABC#4)
// _SafeStr_6158 = "_-w1E" (String#8455, DoABC#4)
// _SafeStr_6159 = "_-38" (String#8828, DoABC#4)
// _SafeStr_8170 = "_-z1C" (String#12053, DoABC#4)


