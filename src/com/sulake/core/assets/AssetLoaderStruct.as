// by nota

//com.sulake.core.assets.AssetLoaderStruct

package com.sulake.core.assets
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.assets.loaders._SafeStr_36;

    public class AssetLoaderStruct extends EventDispatcherWrapper implements _SafeStr_13 
    {

        private var _SafeStr_8017:_SafeStr_36;
        private var _assetName:String;

        public function AssetLoaderStruct(_arg_1:String, _arg_2:_SafeStr_36)
        {
            _assetName = _arg_1;
            _SafeStr_8017 = _arg_2;
        }

        public function get assetName():String
        {
            return (_assetName);
        }

        public function get assetLoader():_SafeStr_36
        {
            return (_SafeStr_8017);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_8017 != null)
                {
                    if (!_SafeStr_8017.disposed)
                    {
                        _SafeStr_8017.dispose();
                        _SafeStr_8017 = null;
                    };
                };
                super.dispose();
            };
        }


    }
}//package com.sulake.core.assets

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_36 = "_-26" (String#6685, DoABC#3)
// _SafeStr_8017 = "_-X1N" (String#8775, DoABC#3)


