// by nota

//com.sulake.core.runtime._SafeStr_1099

package com.sulake.core.runtime
{
    import com.sulake.core.utils.profiler.ProfilerAgent;

    public /*dynamic*/ interface _SafeStr_1099 
    {

        function getProfilerAgentForReceiver(_arg_1:_SafeStr_41):ProfilerAgent;
        function getProfilerAgentsInArray():Array;
        function addStartEventListener(_arg_1:Function):void;
        function addStopEventListener(_arg_1:Function):void;
        function removeStartEventListener(_arg_1:Function):void;
        function removeStopEventListener(_arg_1:Function):void;
        function gc():void;
        function get numAssetLibraryInstances():uint;
        function get numBitmapAssetInstances():uint;
        function get numAllocatedBitmapDataBytes():uint;
        function get numTrackedBitmapDataInstances():uint;
        function get numTrackedBitmapDataBytes():uint;

    }
}//package com.sulake.core.runtime

// _SafeStr_1099 = "_-Vm" (String#8649, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)


