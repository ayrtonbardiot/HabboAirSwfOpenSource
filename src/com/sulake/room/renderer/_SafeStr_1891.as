// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer._SafeStr_1891

package com.sulake.room.renderer
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_31;

    [SecureSWF(rename="true")]
    public class _SafeStr_1891 extends _SafeStr_20 implements IRoomRendererFactory 
    {

        public function _SafeStr_1891(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
        }

        public function createRenderer():IRoomRenderer
        {
            return (new _SafeStr_3204(this));
        }


    }
}//package com.sulake.room.renderer

// _SafeStr_1891 = "_-B1X" (String#15054, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3204 = "_-Q1h" (String#12725, DoABC#4)


