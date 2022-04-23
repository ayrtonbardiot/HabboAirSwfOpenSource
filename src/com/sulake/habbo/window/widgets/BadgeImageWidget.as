// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.BadgeImageWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._SafeStr_3296;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import _-W1K._SafeStr_149;
    import _-W1K._SafeStr_577;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.utils._SafeStr_3250;
    import flash.display.BitmapData;
    import _-XO._SafeStr_197;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;

    public class BadgeImageWidget implements _SafeStr_3349 
    {

        public static const TYPE:String = "badge_image";
        private static const _SafeStr_9172:String = "badge_image:type";
        private static const _SafeStr_9173:String = "badge_image:badge_id";
        private static const TYPE_DEFAULT:PropertyStruct = new PropertyStruct("badge_image:type", "normal", "String", false, _SafeStr_3296.ALL);
        private static const ID_DEFAULT:PropertyStruct = new PropertyStruct("badge_image:badge_id", "", "String");

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5510:Boolean;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _bitmap:IStaticBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _SafeStr_4028:String = TYPE_DEFAULT.value;
        private var _SafeStr_4615:String = ID_DEFAULT.value;
        private var _groupId:int;
        private var _SafeStr_6478:_SafeStr_149;
        private var _SafeStr_5055:_SafeStr_577;

        public function BadgeImageWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("badge_image_xml").content as XML)) as _SafeStr_3133);
            _bitmap = (_SafeStr_5428.findChildByName("bitmap") as IStaticBitmapWrapperWindow);
            _region = (_SafeStr_5428.findChildByName("region") as IRegionWindow);
            _region.addEventListener("WME_CLICK", onClick);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                groupId = 0;
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
            var _local_2:Array = [];
            if (_disposed)
            {
                return (_local_2);
            };
            _local_2.push(TYPE_DEFAULT.withValue(_SafeStr_4028));
            _local_2.push(ID_DEFAULT.withValue(_SafeStr_4615));
            for each (var _local_1:PropertyStruct in _bitmap.properties)
            {
                if (_local_1.key != "asset_uri")
                {
                    _local_2.push(_local_1.withNameSpace("badge_image"));
                };
            };
            return (_local_2);
        }

        public function set properties(_arg_1:Array):void
        {
            _SafeStr_5510 = true;
            var _local_3:Array = [];
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "badge_image:type":
                        type = _local_2.value;
                        break;
                    case "badge_image:badge_id":
                        badgeId = _local_2.value;
                };
                if (_local_2.key != "badge_image:asset_uri")
                {
                    _local_3.push(_local_2.withoutNameSpace());
                };
            };
            _bitmap.properties = _local_3;
            _SafeStr_5510 = false;
            refresh();
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function set type(_arg_1:String):void
        {
            _SafeStr_4028 = _arg_1;
            refresh();
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function set badgeId(_arg_1:String):void
        {
            _SafeStr_4615 = _arg_1;
            refresh();
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function set groupId(_arg_1:int):void
        {
            _groupId = _arg_1;
            var _local_2:Boolean = ((_SafeStr_4028 == "group") && (_groupId > 0));
            if (((!(_windowManager == null)) && (!(_windowManager.communication == null))))
            {
                if (((!(_local_2)) && (!(_SafeStr_5055 == null))))
                {
                    _windowManager.communication.removeHabboConnectionMessageEvent(_SafeStr_6478);
                    _windowManager.communication.removeHabboConnectionMessageEvent(_SafeStr_5055);
                    _SafeStr_6478 = null;
                    _SafeStr_5055 = null;
                }
                else
                {
                    if (((_local_2) && (_SafeStr_5055 == null)))
                    {
                        _SafeStr_6478 = new _SafeStr_149(onGroupDetailsChanged);
                        _SafeStr_5055 = new _SafeStr_577(onHabboGroupBadges);
                        _windowManager.communication.addHabboConnectionMessageEvent(_SafeStr_6478);
                        _windowManager.communication.addHabboConnectionMessageEvent(_SafeStr_5055);
                    };
                };
            };
        }

        public function get bitmapData():BitmapData
        {
            return (_SafeStr_3250(_bitmap).bitmapData);
        }

        public function get pivotPoint():uint
        {
            return (_bitmap.pivotPoint);
        }

        public function set pivotPoint(_arg_1:uint):void
        {
            _bitmap.pivotPoint = _arg_1;
            _bitmap.invalidate();
        }

        public function get stretchedX():Boolean
        {
            return (_bitmap.stretchedX);
        }

        public function set stretchedX(_arg_1:Boolean):void
        {
            _bitmap.stretchedX = _arg_1;
            _bitmap.invalidate();
        }

        public function get stretchedY():Boolean
        {
            return (_bitmap.stretchedY);
        }

        public function set stretchedY(_arg_1:Boolean):void
        {
            _bitmap.stretchedY = _arg_1;
            _bitmap.invalidate();
        }

        public function get zoomX():Number
        {
            return (_bitmap.zoomX);
        }

        public function set zoomX(_arg_1:Number):void
        {
            _bitmap.zoomX = _arg_1;
            _bitmap.invalidate();
        }

        public function get zoomY():Number
        {
            return (_bitmap.zoomY);
        }

        public function set zoomY(_arg_1:Number):void
        {
            _bitmap.zoomY = _arg_1;
            _bitmap.invalidate();
        }

        public function get greyscale():Boolean
        {
            return (_bitmap.greyscale);
        }

        public function set greyscale(_arg_1:Boolean):void
        {
            _bitmap.greyscale = _arg_1;
            _bitmap.invalidate();
        }

        public function get etchingColor():uint
        {
            return (_bitmap.etchingColor);
        }

        public function set etchingColor(_arg_1:uint):void
        {
            _bitmap.etchingColor = _arg_1;
            _bitmap.invalidate();
        }

        public function get fitSizeToContents():Boolean
        {
            return (_bitmap.fitSizeToContents);
        }

        public function set fitSizeToContents(_arg_1:Boolean):void
        {
            _bitmap.fitSizeToContents = _arg_1;
            _bitmap.invalidate();
        }

        private function onClick(_arg_1:WindowMouseEvent):void
        {
            if (_groupId > 0)
            {
                _windowManager.communication.connection.send(new _SafeStr_197(_groupId, true));
            };
        }

        private function refresh():void
        {
            if (_SafeStr_5510)
            {
                return;
            };
            _bitmap.assetUri = assetUri;
            _bitmap.invalidate();
        }

        private function get assetUri():String
        {
            var _local_1:String = "";
            if (((!(_SafeStr_4615 == null)) && (_SafeStr_4615.length > 0)))
            {
                switch (_SafeStr_4028)
                {
                    case "normal":
                        _local_1 = (("${image.library.url}album1584/" + _SafeStr_4615) + ".png");
                        break;
                    case "group":
                        _local_1 = _windowManager.getProperty("group.badge.url").replace("%imagerdata%", _SafeStr_4615);
                        break;
                    case "perk":
                        _local_1 = (("${image.library.url}perk/" + _SafeStr_4615) + ".png");
                };
            };
            return (_local_1);
        }

        private function forceRefresh(_arg_1:int, _arg_2:String):void
        {
            if (_arg_1 != _groupId)
            {
                return;
            };
            _SafeStr_4615 = _arg_2;
            _windowManager.resourceManager.removeAsset(assetUri);
            refresh();
        }

        private function onGroupDetailsChanged(_arg_1:_SafeStr_149):void
        {
            forceRefresh(_arg_1.groupId, _SafeStr_4615);
        }

        private function onHabboGroupBadges(_arg_1:_SafeStr_577):void
        {
            if (_arg_1.badges.hasKey(_groupId))
            {
                forceRefresh(_groupId, _arg_1.badges[_groupId]);
            };
        }

        public function get etchingPoint():Point
        {
            return (new Point(0, 1));
        }

        public function get wrapX():Boolean
        {
            return (false);
        }

        public function set wrapX(_arg_1:Boolean):void
        {
        }

        public function get wrapY():Boolean
        {
            return (false);
        }

        public function set wrapY(_arg_1:Boolean):void
        {
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_149 = "_-k13" (String#10890, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3250 = "_-J1u" (String#3192, DoABC#4)
// _SafeStr_3296 = "_-a1r" (String#16094, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)
// _SafeStr_5055 = "_-u1T" (String#5784, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5510 = "_-M9" (String#3098, DoABC#4)
// _SafeStr_577 = "_-22Z" (String#10958, DoABC#4)
// _SafeStr_6478 = "_-4p" (String#10927, DoABC#4)
// _SafeStr_9172 = "_-k1y" (String#35599, DoABC#4)
// _SafeStr_9173 = "_-di" (String#31702, DoABC#4)


