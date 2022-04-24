// by nota

//com.sulake.habbo.friendbar.talent.TalentProgressMeter

package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime._SafeStr_13;
    import _-t1I._SafeStr_1609;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.utils._SafeStr_401;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window._SafeStr_3109;

    public class TalentProgressMeter implements _SafeStr_13 
    {

        private const ACHIEVED_DIVIDER:String = "talent_achieved_div";
        private const UNACHIEVED_DIVIDER:String = "talent_unachieved_div";
        private const DIVIDER_WINDOW_PREFIX:String = "progress_divider_level_";
        private const AVATAR_GLOW_RADIUS:int = 10;

        private var _disposed:Boolean = false;
        private var _habboTalent:HabboTalent;
        private var _SafeStr_4360:TalentTrackController;
        private var _talentTrack:_SafeStr_1609;
        private var _SafeStr_6803:_SafeStr_3133;
        private var _divider:IStaticBitmapWrapperWindow;
        private var _SafeStr_6804:_SafeStr_3199;
        private var _SafeStr_6806:IStaticBitmapWrapperWindow;
        private var _SafeStr_6805:IStaticBitmapWrapperWindow;

        public function TalentProgressMeter(_arg_1:HabboTalent, _arg_2:TalentTrackController)
        {
            _habboTalent = _arg_1;
            _SafeStr_4360 = _arg_2;
            _talentTrack = _SafeStr_4360.talentTrack;
            createMeter();
        }

        public function get width():int
        {
            return (_SafeStr_4360.window.width);
        }

        public function get progressPerLevelWidth():int
        {
            return (Math.floor(_SafeStr_401.lerp(_talentTrack.progressPerLevel, 0, width)));
        }

        private function createMeter():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _SafeStr_6803 = _SafeStr_3133(_SafeStr_4360.window.findChildByName("progress_container"));
            _divider = IStaticBitmapWrapperWindow(_SafeStr_6803.removeChild(_SafeStr_6803.findChildByName("progress_level_divider")));
            _SafeStr_6806 = IStaticBitmapWrapperWindow(_SafeStr_6803.findChildByName("achieved_mid"));
            _SafeStr_6805 = IStaticBitmapWrapperWindow(_SafeStr_6803.findChildByName("unachieved_mid"));
            _local_2 = 1;
            while (_local_2 < _talentTrack.levels.length)
            {
                _local_1 = IStaticBitmapWrapperWindow(_divider.clone());
                _local_1.name = ("progress_divider_level_" + _local_2);
                _SafeStr_6803.addChild(_local_1);
                _local_2++;
            };
            _SafeStr_6804 = _SafeStr_3199(_SafeStr_6803.findChildByName("progress_needle"));
            _SafeStr_3289(_SafeStr_6804.widget).figure = _habboTalent.sessionManager.figure;
            _SafeStr_6803.setChildIndex(_SafeStr_6804, (_SafeStr_6803.numChildren - 1));
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_divider)
                {
                    _divider.dispose();
                    _divider = null;
                };
                _SafeStr_6806 = null;
                _SafeStr_6805 = null;
                _SafeStr_6804 = null;
                _SafeStr_6803 = null;
                _talentTrack = null;
                _SafeStr_4360 = null;
                _habboTalent = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function resize():void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_1:int = Math.floor(_SafeStr_401.lerp(_talentTrack.totalProgress, 0, width));
            _SafeStr_6803.width = width;
            _SafeStr_6805.width = width;
            _SafeStr_6806.width = _local_1;
            _SafeStr_6804.x = _SafeStr_401.clamp((_local_1 - int((_SafeStr_6804.width / 2))), 0, (width - _SafeStr_6804.width));
            var _local_2:_SafeStr_3109 = _SafeStr_6803.findChildByName("avatar_glow");
            _local_2.x = (_SafeStr_6804.x - 10);
            _local_2.y = (_SafeStr_6804.y - 10);
            _local_2.width = (_SafeStr_6804.width + (2 * 10));
            _local_2.height = (_SafeStr_6804.height + (2 * 10));
            var _local_3:_SafeStr_3109 = _SafeStr_6803.findChildByName("progress_balloon");
            _local_3.x = (((_SafeStr_6804.x + Math.floor((_SafeStr_6804.width / 2))) - Math.floor((_local_3.width / 2))) + 5);
            _local_5 = 1;
            while (_local_5 < _talentTrack.levels.length)
            {
                _local_4 = IStaticBitmapWrapperWindow(_SafeStr_6803.findChildByName(("progress_divider_level_" + _local_5)));
                _local_4.x = (_local_5 * progressPerLevelWidth);
                if (_local_4.x < _local_1)
                {
                    _local_4.assetUri = "talent_achieved_div";
                }
                else
                {
                    _local_4.assetUri = "talent_unachieved_div";
                };
                _local_4.visible = true;
                _local_5++;
            };
            _SafeStr_6803.invalidate();
        }


    }
}//package com.sulake.habbo.friendbar.talent

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1609 = "_-g" (String#26072, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_401 = "_-e1d" (String#5870, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6803 = "_-h1H" (String#4305, DoABC#4)
// _SafeStr_6804 = "_-B1s" (String#4585, DoABC#4)
// _SafeStr_6805 = "_-g1Y" (String#12422, DoABC#4)
// _SafeStr_6806 = "_-p1S" (String#11695, DoABC#4)


