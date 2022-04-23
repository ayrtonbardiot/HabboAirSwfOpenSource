// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.PlaceholderAvatarImage

package com.sulake.habbo.avatar
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import flash.display.BitmapData;

    public class PlaceholderAvatarImage extends AvatarImage 
    {

        internal static var _fullImageCache:_SafeStr_24 = new _SafeStr_24();

        public function PlaceholderAvatarImage(_arg_1:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String, _arg_5:EffectAssetDownloadManager)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, null);
        }

        override public function dispose():void
        {
            if (!_SafeStr_4036)
            {
                if (_cache)
                {
                    _cache.dispose();
                    _cache = null;
                };
                _SafeStr_3762 = null;
                _assets = null;
                _mainAction = null;
                _SafeStr_3819 = null;
                _SafeStr_4247 = null;
                _SafeStr_4249 = null;
                if (((!(_SafeStr_4246)) && (_SafeStr_4204)))
                {
                    _SafeStr_4204.dispose();
                };
                _SafeStr_4204 = null;
                _SafeStr_4237 = null;
                _SafeStr_4036 = true;
            };
        }

        override protected function getFullImage(_arg_1:String):BitmapData
        {
            return (_fullImageCache[_arg_1]);
        }

        override protected function cacheFullImage(_arg_1:String, _arg_2:BitmapData):void
        {
            if (_fullImageCache.getValue(_arg_1))
            {
                (_fullImageCache.getValue(_arg_1) as BitmapData).dispose();
                _fullImageCache.remove(_arg_1);
            };
            _fullImageCache[_arg_1] = _arg_2;
        }

        override public function appendAction(_arg_1:String, ... _args):Boolean
        {
            var _local_3:* = null;
            if (((!(_args == null)) && (_args.length > 0)))
            {
                _local_3 = _args[0];
            };
            switch (_arg_1)
            {
                case "posture":
                    switch (_local_3)
                    {
                        case "lay":
                        case "mv":
                        case "std":
                        case "swim":
                        case "float":
                        case "sit":
                            super.appendAction.apply(null, [_arg_1].concat(_args));
                    };
                    break;
                case "fx":
                case "dance":
                case "wave":
                case "sign":
                case "cri":
                case "usei":
                case "blow":
                    super.addActionData.apply(null, [_arg_1].concat(_args));
            };
            return (true);
        }

        override public function isPlaceholder():Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3762 = "_-Q11" (String#1051, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4237 = "_-7h" (String#3677, DoABC#4)
// _SafeStr_4246 = "_-RG" (String#10274, DoABC#4)
// _SafeStr_4247 = "_-E1G" (String#5747, DoABC#4)
// _SafeStr_4249 = "_-Mb" (String#2437, DoABC#4)


