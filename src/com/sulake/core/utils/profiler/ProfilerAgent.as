// by nota

//com.sulake.core.utils.profiler.ProfilerAgent

package com.sulake.core.utils.profiler
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import flash.utils.getQualifiedClassName;

    public class ProfilerAgent extends ProfilerAgentTask implements _SafeStr_13 
    {

        protected var _receiver:_SafeStr_41;

        public function ProfilerAgent(_arg_1:_SafeStr_41)
        {
            _receiver = _arg_1;
            var _local_2:String = getQualifiedClassName(_receiver);
            super(_local_2.slice((_local_2.lastIndexOf(":") + 1), _local_2.length));
        }

        public function get receiver():_SafeStr_41
        {
            return (_receiver);
        }

        override public function dispose():void
        {
            _receiver = null;
            super.dispose();
        }

        public function update(_arg_1:int):void
        {
            if (!paused)
            {
                super.start();
                _receiver.update(_arg_1);
                super.stop();
            };
        }


    }
}//package com.sulake.core.utils.profiler

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)


