// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils.profiler.ProfilerViewer

package com.sulake.core.utils.profiler
{
    import flash.text.TextField;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_1099;
    import flash.text.TextFormat;

    public class ProfilerViewer extends TextField implements _SafeStr_13 
    {

        protected var _disposed:Boolean = false;
        private var _SafeStr_8054:_SafeStr_1099;

        public function ProfilerViewer(_arg_1:_SafeStr_1099)
        {
            var _local_2:TextFormat = new TextFormat("Courier New", 8);
            defaultTextFormat = _local_2;
            setTextFormat(_local_2);
            textColor = 0xFFFFFF;
            width = 10;
            height = 10;
            autoSize = "left";
            mouseEnabled = false;
            selectable = false;
            super();
            if (_arg_1)
            {
                _SafeStr_8054 = _arg_1;
                _SafeStr_8054.addStopEventListener(refresh);
            };
        }

        private static function padAlign(_arg_1:String, _arg_2:int, _arg_3:String=" ", _arg_4:Boolean=false):String
        {
            var _local_6:int;
            var _local_5:int = (_arg_2 - _arg_1.length);
            if (_local_5 <= 0)
            {
                return (_arg_1.substring(0, _arg_2));
            };
            var _local_7:String = "";
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_7 = (_local_7 + _arg_3);
                _local_6++;
            };
            return ((_arg_4) ? (_local_7 + _arg_1) : (_arg_1 + _local_7));
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set profiler(_arg_1:_SafeStr_1099):void
        {
            if (((!(_SafeStr_8054)) && (_arg_1)))
            {
                _SafeStr_8054 = _arg_1;
                _SafeStr_8054.addStopEventListener(refresh);
            };
        }

        public function get profiler():_SafeStr_1099
        {
            return (_SafeStr_8054);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (parent != null)
                {
                    parent.removeChild(this);
                };
                if (_SafeStr_8054)
                {
                    _SafeStr_8054.removeStopEventListener(refresh);
                    _SafeStr_8054 = null;
                };
                _disposed = true;
            };
        }

        public function refresh():void
        {
            text = (((((((((((((((((((padAlign("task", 30) + "|") + padAlign("#rounds", 10, " ", true)) + "|") + padAlign("latest ms", 10, " ", true)) + "|") + padAlign("average ms", 10, " ", true)) + "|") + padAlign("total ms", 10, " ", true)) + "|\r") + padAlign("", 30, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|") + padAlign("", 10, "-")) + "|\r");
            var _local_1:Array = _SafeStr_8054.getProfilerAgentsInArray();
            while (_local_1.length > 0)
            {
                recursiveUpdate(_local_1.pop(), 0);
            };
            if (parent)
            {
                parent.swapChildren(this, parent.getChildAt((parent.numChildren - 1)));
            };
        }

        private function recursiveUpdate(_arg_1:ProfilerAgentTask, _arg_2:uint):void
        {
            var _local_3:uint;
            text = (text + (((((((((padAlign(_arg_1.name, 30) + "|") + padAlign(_arg_1.rounds, 10)) + "|") + padAlign(_arg_1.latest, 10)) + "|") + padAlign(_arg_1.average, 10)) + "|") + padAlign(_arg_1.total, 10)) + "|\r"));
            _local_3 = 0;
            while (_local_3 < _arg_1.numSubTasks)
            {
                recursiveUpdate(_arg_1.getSubTaskAt(_local_3), (_arg_2 + 1));
                _local_3++;
            };
        }


    }
}//package com.sulake.core.utils.profiler

// _SafeStr_1099 = "_-Vm" (String#8649, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_8054 = "_-71" (String#7007, DoABC#3)


