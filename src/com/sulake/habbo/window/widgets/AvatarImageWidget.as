// by nota

//com.sulake.habbo.window.widgets.AvatarImageWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.filters.ColorMatrixFilter;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class AvatarImageWidget implements _SafeStr_3289, _SafeStr_1875 
    {

        public static const TYPE:String = "avatar_image";
        private static const FIGURE_KEY:String = "avatar_image:figure";
        private static const SCALE_KEY:String = "avatar_image:scale";
        private static const _SafeStr_9170:String = "avatar_image:only_head";
        private static const CROPPED_KEY:String = "avatar_image:cropped";
        private static const _SafeStr_9171:String = "avatar_image:direction";
        private static const _SafeStr_6182:Array = ["northeast", "east", "southeast", "south", "southwest", "west", "northwest", "north"];
        private static const FIGURE_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:figure", "hd-180-1.ch-210-66.lg-270-82.sh-290-81", "String");
        private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:scale", "h", "String", false, ["sh", "h"]);
        private static const ONLY_HEAD_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:only_head", false, "Boolean");
        private static const CROPPED_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:cropped", false, "Boolean");
        private static const DIRECTION_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:direction", _SafeStr_6182[2], "String", false, _SafeStr_6182);

        private const rc:Number = 0.333333333333333;
        private const gc:Number = 0.333333333333333;
        private const bc:Number = 0.333333333333333;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _bitmap:_SafeStr_3264;
        private var _region:IRegionWindow;
        private var _SafeStr_3819:String = FIGURE_DEFAULT.value;
        private var _SafeStr_4045:String = SCALE_DEFAULT.value;
        private var _onlyHead:Boolean = ONLY_HEAD_DEFAULT.value;
        private var _cropped:Boolean = CROPPED_DEFAULT.value;
        private var _direction:int = _SafeStr_6182.indexOf(DIRECTION_DEFAULT.value);
        private var _SafeStr_4128:int;

        public function AvatarImageWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("avatar_image_xml").content as XML)) as _SafeStr_3133);
            _bitmap = (_SafeStr_5428.findChildByName("bitmap") as _SafeStr_3264);
            _region = (_SafeStr_5428.findChildByName("region") as IRegionWindow);
            _region.addEventListener("WME_CLICK", onClick);
            refresh();
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_region != null)
                {
                    _region.removeEventListener("WME_CLICK", onClick);
                    _region.dispose();
                    _region = null;
                };
                _bitmap = null;
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
            return (EmptyIterator.INSTANCE);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(FIGURE_DEFAULT.withValue(_SafeStr_3819));
            _local_1.push(SCALE_DEFAULT.withValue(_SafeStr_4045));
            _local_1.push(ONLY_HEAD_DEFAULT.withValue(_onlyHead));
            _local_1.push(CROPPED_DEFAULT.withValue(_cropped));
            _local_1.push(DIRECTION_DEFAULT.withValue(_SafeStr_6182[_direction]));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "avatar_image:figure":
                        figure = _local_2.value;
                        break;
                    case "avatar_image:scale":
                        scale = _local_2.value;
                        break;
                    case "avatar_image:only_head":
                        onlyHead = _local_2.value;
                        break;
                    case "avatar_image:cropped":
                        cropped = _local_2.value;
                        break;
                    case "avatar_image:direction":
                        direction = _SafeStr_6182.indexOf(_local_2.value);
                };
            };
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function set figure(_arg_1:String):void
        {
            _SafeStr_3819 = cleanupAvatarString(_arg_1);
            refresh();
        }

        public function get scale():String
        {
            return (_SafeStr_4045);
        }

        public function set scale(_arg_1:String):void
        {
            _SafeStr_4045 = _arg_1;
            refresh();
        }

        public function get onlyHead():Boolean
        {
            return (_onlyHead);
        }

        public function set onlyHead(_arg_1:Boolean):void
        {
            _onlyHead = _arg_1;
            refresh();
        }

        public function get cropped():Boolean
        {
            return (_cropped);
        }

        public function set cropped(_arg_1:Boolean):void
        {
            _cropped = _arg_1;
            refresh();
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function set direction(_arg_1:int):void
        {
            _direction = _arg_1;
            refresh();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function set userId(_arg_1:int):void
        {
            _SafeStr_4128 = _arg_1;
            _region.visible = (_SafeStr_4128 > 0);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (cleanupAvatarString(_arg_1) == _SafeStr_3819)
            {
                refresh();
            };
        }

        private function refresh():void
        {
            var _local_4:Number;
            var _local_1:* = null;
            var _local_2:* = null;
            _bitmap.bitmap = null;
            var _local_3:Boolean;
            var _local_5:String = _SafeStr_3819;
            if (((_local_5 == null) || (_local_5.length == 0)))
            {
                _local_3 = true;
                _local_5 = String(FIGURE_DEFAULT.value);
            };
            if (_windowManager.avatarRenderer != null)
            {
                _local_4 = ((_SafeStr_4045 == "h") ? 1 : 0.5);
                _local_1 = _windowManager.avatarRenderer.createAvatarImage(_local_5, "h", null, this);
                if (_local_1 != null)
                {
                    _local_1.setDirection(((_onlyHead) ? "head" : "full"), _direction);
                    if (_cropped)
                    {
                        _bitmap.bitmap = _local_1.getCroppedImage(((_onlyHead) ? "head" : "full"), _local_4);
                    }
                    else
                    {
                        _bitmap.bitmap = _local_1.getImage(((_onlyHead) ? "head" : "full"), true, _local_4);
                    };
                    if (_local_3)
                    {
                        greyBitmap(_bitmap);
                    };
                    _bitmap.disposesBitmap = true;
                    _local_1.dispose();
                };
            };
            if (((_bitmap.bitmap == null) || (_bitmap.bitmap.width < 2)))
            {
                _local_2 = (((("placeholder_avatar" + ((_SafeStr_4045 == "sh") ? "_small" : "")) + ((_onlyHead) ? "_head" : "")) + ((_cropped) ? "_cropped" : "")) + "_png");
                _bitmap.bitmap = (_windowManager.assets.getAssetByName(_local_2).content as BitmapData);
                _bitmap.disposesBitmap = false;
                greyBitmap(_bitmap);
            };
            _bitmap.invalidate();
            _SafeStr_5427.width = _bitmap.bitmap.width;
            _SafeStr_5427.height = _bitmap.bitmap.height;
        }

        private function greyBitmap(_arg_1:_SafeStr_3264):void
        {
            _bitmap.bitmap.applyFilter(_bitmap.bitmap, _bitmap.bitmap.rect, new Point(), new ColorMatrixFilter([0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0, 0, 0, 1, 0]));
        }

        private function cleanupAvatarString(_arg_1:String):String
        {
            return ((_arg_1 == null) ? FIGURE_DEFAULT.value : _arg_1.replace(/NaN/g, ""));
        }

        private function onClick(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4128 > 0)
            {
                _windowManager.communication.connection.send(new _SafeStr_313(_SafeStr_4128));
            };
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_6182 = "_-qF" (String#3305, DoABC#4)
// _SafeStr_9170 = "_-hb" (String#32395, DoABC#4)
// _SafeStr_9171 = "_-VE" (String#24594, DoABC#4)


