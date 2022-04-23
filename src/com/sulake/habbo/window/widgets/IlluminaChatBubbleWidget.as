// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.IlluminaChatBubbleWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.events._SafeStr_3116;

    public class IlluminaChatBubbleWidget implements IIlluminaChatBubbleWidget 
    {

        public static const TYPE:String = "illumina_chat_bubble";
        private static const _SafeStr_9179:String = "illumina_chat_bubble:flipped";
        private static const USER_NAME_KEY:String = "illumina_chat_bubble:user_name";
        private static const FIGURE_KEY:String = "illumina_chat_bubble:figure";
        private static const MESSAGE_KEY:String = "illumina_chat_bubble:message";
        private static const FLIPPED_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:flipped", false, "Boolean");
        private static const USER_NAME_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:user_name", "", "String");
        private static const FIGURE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:figure", "", "String");
        private static const MESSAGE_DEFAULT:PropertyStruct = new PropertyStruct("illumina_chat_bubble:message", "", "String");

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5861:Boolean = FLIPPED_DEFAULT.value;
        private var _userName:ILabelWindow;
        private var _SafeStr_5863:_SafeStr_3109;
        private var _avatarWidget:_SafeStr_3289;
        private var _SafeStr_5862:_SafeStr_3109;
        private var _SafeStr_4132:ITextWindow;
        private var _postTime:_SafeStr_3351;
        private var _offline:IRegionWindow;
        private var _arrowPoint:IStaticBitmapWrapperWindow;
        private var _SafeStr_5510:Boolean;

        public function IlluminaChatBubbleWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("illumina_chat_bubble_xml").content as XML)) as _SafeStr_3133);
            _userName = (_SafeStr_5428.findChildByName("user_name") as ILabelWindow);
            var _local_3:_SafeStr_3199 = (_SafeStr_5428.findChildByName("user_avatar") as _SafeStr_3199);
            _SafeStr_5863 = _local_3.parent;
            _avatarWidget = (_local_3.widget as _SafeStr_3289);
            _SafeStr_5862 = _SafeStr_5428.findChildByName("bubble_wrapper");
            _SafeStr_4132 = (_SafeStr_5428.findChildByName("message") as ITextWindow);
            _postTime = (_SafeStr_3199(_SafeStr_5428.findChildByName("post_time")).widget as _SafeStr_3351);
            _offline = (_SafeStr_5428.findChildByName("offline_placeholder") as IRegionWindow);
            _offline.height = 0;
            _arrowPoint = (_SafeStr_5428.findChildByName("arrow_point") as IStaticBitmapWrapperWindow);
            _SafeStr_5428.findChildByName("message_region").setParamFlag(1, false);
            _SafeStr_5428.procedure = rootProcedure;
            userName = USER_NAME_DEFAULT.value;
            figure = FIGURE_DEFAULT.value;
            message = MESSAGE_DEFAULT.value;
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5427.setParamFlag(147456);
            _SafeStr_5428.width = _SafeStr_5427.width;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
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
            _local_1.push(FLIPPED_DEFAULT.withValue(flipped));
            _local_1.push(USER_NAME_DEFAULT.withValue(userName));
            _local_1.push(FIGURE_DEFAULT.withValue(figure));
            _local_1.push(MESSAGE_DEFAULT.withValue(message));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "illumina_chat_bubble:flipped":
                        flipped = _local_2.value;
                        break;
                    case "illumina_chat_bubble:user_name":
                        userName = _local_2.value;
                        break;
                    case "illumina_chat_bubble:figure":
                        figure = _local_2.value;
                        break;
                    case "illumina_chat_bubble:message":
                        message = _local_2.value;
                };
            };
        }

        public function get flipped():Boolean
        {
            return (_SafeStr_5861);
        }

        public function set flipped(_arg_1:Boolean):void
        {
            _SafeStr_5861 = _arg_1;
            refresh();
        }

        public function get userName():String
        {
            return (_userName.caption.slice(0, -1));
        }

        public function set userName(_arg_1:String):void
        {
            _userName.caption = (_arg_1 + ":");
        }

        public function get userId():int
        {
            return (_avatarWidget.userId);
        }

        public function set userId(_arg_1:int):void
        {
            _avatarWidget.userId = _arg_1;
        }

        public function get figure():String
        {
            return (_avatarWidget.figure);
        }

        public function set figure(_arg_1:String):void
        {
            _avatarWidget.figure = _arg_1;
        }

        public function get message():String
        {
            return (_SafeStr_4132.caption);
        }

        public function set message(_arg_1:String):void
        {
            _SafeStr_4132.caption = _arg_1;
        }

        public function get timeStamp():Number
        {
            return (_postTime.timeStamp);
        }

        public function set timeStamp(_arg_1:Number):void
        {
            _postTime.timeStamp = _arg_1;
        }

        public function set friendOnlineStatus(_arg_1:Boolean):void
        {
            _offline.height = ((_arg_1) ? 0 : 16);
        }

        public function refresh():void
        {
            if (_SafeStr_5510)
            {
                return;
            };
            _SafeStr_5510 = true;
            _SafeStr_5428.limits.minWidth = _SafeStr_5428.width;
            _SafeStr_5428.limits.maxWidth = _SafeStr_5428.width;
            _SafeStr_5428.height = _SafeStr_5862.bottom;
            _SafeStr_5862.width = (_SafeStr_5428.width - _SafeStr_5863.width);
            _SafeStr_4132.width = _SafeStr_5862.width;
            _avatarWidget.direction = ((_SafeStr_5861) ? 4 : 2);
            if (_SafeStr_5861)
            {
                _SafeStr_5863.x = (_SafeStr_5428.width - _SafeStr_5863.width);
                _arrowPoint.zoomX = 1;
                _arrowPoint.x = _SafeStr_5863.x;
                _SafeStr_5862.x = 0;
            }
            else
            {
                _SafeStr_5863.x = 0;
                _arrowPoint.zoomX = -1;
                _arrowPoint.x = (_SafeStr_5863.right - _arrowPoint.width);
                _SafeStr_5862.x = _SafeStr_5863.right;
            };
            _SafeStr_5428.limits.setEmpty();
            _arrowPoint.invalidate();
            _SafeStr_5510 = false;
        }

        private function rootProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WE_RESIZED":
                    refresh();
                    return;
                case "WE_CHILD_RESIZED":
                    refresh();
                    return;
                case "WME_CLICK":
                    if (((userId > 0) && (_arg_2.name == "user_name_region")))
                    {
                        _windowManager.communication.connection.send(new _SafeStr_313(userId));
                    };
                    return;
            };
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3351 = "_-bh" (String#10123, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5510 = "_-M9" (String#3098, DoABC#4)
// _SafeStr_5861 = "_-Te" (String#10079, DoABC#4)
// _SafeStr_5862 = "_-H1c" (String#9056, DoABC#4)
// _SafeStr_5863 = "_-F1K" (String#7702, DoABC#4)
// _SafeStr_9179 = "_-c1w" (String#37578, DoABC#4)


