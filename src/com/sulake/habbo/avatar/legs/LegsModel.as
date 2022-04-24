// by nota

//com.sulake.habbo.avatar.legs.LegsModel

package com.sulake.habbo.avatar.legs
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.habbo.avatar.HabboAvatarEditor;

    public class LegsModel extends CategoryBaseModel implements _SafeStr_3301 
    {

        public function LegsModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
        }

        override protected function init():void
        {
            super.init();
            initCategory("lg");
            initCategory("sh");
            initCategory("wa");
            _SafeStr_3883 = true;
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new LegsView(this);
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.init();
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.legs

// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)


