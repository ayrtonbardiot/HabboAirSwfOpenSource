// by nota

//com.sulake.core.window.events._SafeStr_3116

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class _SafeStr_3116 
    {

        public static const _SafeStr_8172:String = "WE_DESTROY";
        public static const _SafeStr_8173:String = "WE_DESTROYED";
        public static const _SafeStr_8174:String = "WE_OPEN";
        public static const _SafeStr_8175:String = "WE_OPENED";
        public static const _SafeStr_8176:String = "WE_CLOSE";
        public static const _SafeStr_8177:String = "WE_CLOSED";
        public static const WINDOW_EVENT_FOCUS:String = "WE_FOCUS";
        public static const _SafeStr_8178:String = "WE_FOCUSED";
        public static const WINDOW_EVENT_UNFOCUS:String = "WE_UNFOCUS";
        public static const _SafeStr_8179:String = "WE_UNFOCUSED";
        public static const _SafeStr_8180:String = "WE_ACTIVATE";
        public static const _SafeStr_8181:String = "WE_ACTIVATED";
        public static const _SafeStr_8182:String = "WE_DEACTIVATE";
        public static const _SafeStr_8183:String = "WE_DEACTIVATED";
        public static const _SafeStr_8184:String = "WE_SELECT";
        public static const _SafeStr_8185:String = "WE_SELECTED";
        public static const _SafeStr_8186:String = "WE_UNSELECT";
        public static const _SafeStr_8187:String = "WE_UNSELECTED";
        public static const WINDOW_EVENT_LOCK:String = "WE_LOCK";
        public static const _SafeStr_8188:String = "WE_LOCKED";
        public static const WINDOW_EVENT_UNLOCK:String = "WE_UNLOCK";
        public static const _SafeStr_8189:String = "WE_UNLOCKED";
        public static const _SafeStr_8190:String = "WE_ENABLE";
        public static const _SafeStr_8191:String = "WE_ENABLED";
        public static const _SafeStr_8192:String = "WE_DISABLE";
        public static const _SafeStr_8193:String = "WE_DISABLED";
        public static const _SafeStr_8194:String = "WE_RELOCATE";
        public static const _SafeStr_8195:String = "WE_RELOCATED";
        public static const _SafeStr_8196:String = "WE_RESIZE";
        public static const _SafeStr_8197:String = "WE_RESIZED";
        public static const _SafeStr_8198:String = "WE_MINIMIZE";
        public static const _SafeStr_8199:String = "WE_MINIMIZED";
        public static const _SafeStr_8200:String = "WE_MAXIMIZE";
        public static const _SafeStr_8201:String = "WE_MAXIMIZED";
        public static const WINDOW_EVENT_RESTORE:String = "WE_RESTORE";
        public static const _SafeStr_8202:String = "WE_RESTORED";
        public static const _SafeStr_8203:String = "WE_CHILD_ADDED";
        public static const _SafeStr_8204:String = "WE_CHILD_REMOVED";
        public static const _SafeStr_8205:String = "WE_CHILD_RELOCATED";
        public static const _SafeStr_8206:String = "WE_CHILD_RESIZED";
        public static const _SafeStr_8207:String = "WE_CHILD_ACTIVATED";
        public static const _SafeStr_8208:String = "WE_CHILD_VISIBILITY";
        public static const _SafeStr_8209:String = "WE_PARENT_ADDED";
        public static const _SafeStr_8210:String = "WE_PARENT_REMOVED";
        public static const _SafeStr_8211:String = "WE_PARENT_RELOCATED";
        public static const _SafeStr_8212:String = "WE_PARENT_RESIZED";
        public static const _SafeStr_8213:String = "WE_PARENT_ACTIVATED";
        public static const _SafeStr_8214:String = "WE_OK";
        public static const _SafeStr_8215:String = "WE_CANCEL";
        public static const WINDOW_EVENT_CHANGE:String = "WE_CHANGE";
        public static const _SafeStr_8216:String = "WE_SCROLL";
        public static const UNKNOWN:String = "";
        private static const _SafeStr_4027:Array = [];

        protected var _SafeStr_4028:String;
        protected var _window:_SafeStr_3109;
        protected var _SafeStr_4029:_SafeStr_3109;
        protected var _SafeStr_4033:Boolean;
        protected var _SafeStr_4030:Boolean;
        protected var _SafeStr_4031:Boolean;
        protected var _SafeStr_4032:Array;


        public static function allocate(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_3109, _arg_4:Boolean=false):_SafeStr_3116
        {
            var _local_5:_SafeStr_3116 = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (_SafeStr_3116)());
            _local_5._SafeStr_4028 = _arg_1;
            _local_5._window = _arg_2;
            _local_5._SafeStr_4029 = _arg_3;
            _local_5._SafeStr_4030 = _arg_4;
            _local_5._SafeStr_4031 = false;
            _local_5._SafeStr_4032 = _SafeStr_4027;
            return (_local_5);
        }


        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get target():_SafeStr_3109
        {
            return (_window);
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        public function get related():_SafeStr_3109
        {
            return (_SafeStr_4029);
        }

        public function get cancelable():Boolean
        {
            return (_SafeStr_4030);
        }

        public function recycle():void
        {
            if (_SafeStr_4031)
            {
                throw (new Error("Event already recycled!"));
            };
            _window = (_SafeStr_4029 = null);
            _SafeStr_4031 = true;
            _SafeStr_4033 = false;
            _SafeStr_4032.push(this);
        }

        public function clone():_SafeStr_3116
        {
            return (allocate(_SafeStr_4028, window, related, cancelable));
        }

        public function preventDefault():void
        {
            preventWindowOperation();
        }

        public function isDefaultPrevented():Boolean
        {
            return (_SafeStr_4033);
        }

        public function preventWindowOperation():void
        {
            if (cancelable)
            {
                _SafeStr_4033 = true;
            }
            else
            {
                throw (new Error("Attempted to prevent window operation that is not cancelable!"));
            };
        }

        public function isWindowOperationPrevented():Boolean
        {
            return (_SafeStr_4033);
        }

        public function stopPropagation():void
        {
            _SafeStr_4033 = true;
        }

        public function stopImmediatePropagation():void
        {
            _SafeStr_4033 = true;
        }

        public function toString():String
        {
            return (((((("WindowEvent { type: " + _SafeStr_4028) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " }");
        }


    }
}//package com.sulake.core.window.events

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4029 = "_-k7" (String#7281, DoABC#4)
// _SafeStr_4030 = "_-lP" (String#6874, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_4032 = "_-3H" (String#8484, DoABC#4)
// _SafeStr_4033 = "_-j1d" (String#6748, DoABC#4)
// _SafeStr_8172 = "_-D1d" (String#31750, DoABC#4)
// _SafeStr_8173 = "_-61J" (String#33748, DoABC#4)
// _SafeStr_8174 = "_-b13" (String#37396, DoABC#4)
// _SafeStr_8175 = "_-DW" (String#39663, DoABC#4)
// _SafeStr_8176 = "_-C1X" (String#34401, DoABC#4)
// _SafeStr_8177 = "_-j19" (String#36775, DoABC#4)
// _SafeStr_8178 = "_-31u" (String#32615, DoABC#4)
// _SafeStr_8179 = "_-v1Y" (String#34176, DoABC#4)
// _SafeStr_8180 = "_-u1d" (String#35193, DoABC#4)
// _SafeStr_8181 = "_-aC" (String#32026, DoABC#4)
// _SafeStr_8182 = "_-c1n" (String#37644, DoABC#4)
// _SafeStr_8183 = "_-321" (String#33113, DoABC#4)
// _SafeStr_8184 = "_-SZ" (String#39433, DoABC#4)
// _SafeStr_8185 = "_-TG" (String#39505, DoABC#4)
// _SafeStr_8186 = "_-W1d" (String#36656, DoABC#4)
// _SafeStr_8187 = "_-x1E" (String#32862, DoABC#4)
// _SafeStr_8188 = "_-h1k" (String#35410, DoABC#4)
// _SafeStr_8189 = "_-c13" (String#37499, DoABC#4)
// _SafeStr_8190 = "_-cN" (String#31719, DoABC#4)
// _SafeStr_8191 = "_-de" (String#31677, DoABC#4)
// _SafeStr_8192 = "_-zt" (String#34559, DoABC#4)
// _SafeStr_8193 = "_-h0" (String#31818, DoABC#4)
// _SafeStr_8194 = "_-hN" (String#32328, DoABC#4)
// _SafeStr_8195 = "_-zL" (String#34623, DoABC#4)
// _SafeStr_8196 = "_-21z" (String#34245, DoABC#4)
// _SafeStr_8197 = "_-L1k" (String#39186, DoABC#4)
// _SafeStr_8198 = "_-t1k" (String#39205, DoABC#4)
// _SafeStr_8199 = "_-ez" (String#31792, DoABC#4)
// _SafeStr_8200 = "_-f1s" (String#38002, DoABC#4)
// _SafeStr_8201 = "_-b1A" (String#37399, DoABC#4)
// _SafeStr_8202 = "_-V1I" (String#36402, DoABC#4)
// _SafeStr_8203 = "_-eZ" (String#31805, DoABC#4)
// _SafeStr_8204 = "_-GF" (String#39906, DoABC#4)
// _SafeStr_8205 = "_-02n" (String#35298, DoABC#4)
// _SafeStr_8206 = "_-R9" (String#39493, DoABC#4)
// _SafeStr_8207 = "_-i3" (String#32339, DoABC#4)
// _SafeStr_8208 = "_-Y1w" (String#35474, DoABC#4)
// _SafeStr_8209 = "_-o1N" (String#40357, DoABC#4)
// _SafeStr_8210 = "_-hD" (String#32301, DoABC#4)
// _SafeStr_8211 = "_-QN" (String#39268, DoABC#4)
// _SafeStr_8212 = "_-d0" (String#31717, DoABC#4)
// _SafeStr_8213 = "_-Bn" (String#39750, DoABC#4)
// _SafeStr_8214 = "_-im" (String#32416, DoABC#4)
// _SafeStr_8215 = "_-y15" (String#33310, DoABC#4)
// _SafeStr_8216 = "_-HI" (String#39640, DoABC#4)


