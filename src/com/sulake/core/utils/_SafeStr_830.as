// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils._SafeStr_830

package com.sulake.core.utils
{
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class _SafeStr_830 extends _SafeStr_24 
    {


        override flash_proxy function setProperty(_arg_1:*, _arg_2:*):void
        {
            if (hasKey(((_arg_1 is QName) ? QName(_arg_1).localName : _arg_1)))
            {
                throw (new Error(((("Trying to overwrite value in SingleWriteMap - key: " + _arg_1) + ", value: ") + _arg_2)));
            };
            super.setProperty(_arg_1, _arg_2);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_830 = "_-kl" (String#9712, DoABC#3)


