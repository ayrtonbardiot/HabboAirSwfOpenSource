// by nota

//login.AvatarView

package login
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import onBoardingHcUi.ColouredButton;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.login.AvatarData;
    import flash.display.DisplayObjectContainer;
    import flash.display.Bitmap;
    import flash.utils.Timer;
    import flash.events.Event;
    import onBoardingHcUi.LoaderUI;
    import flash.events.TimerEvent;
    import flash.geom.Rectangle;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.ErrorEvent;
    import flash.events.MouseEvent;
    import flash.display.LoaderInfo;
    import flash.display.DisplayObject;
    import onBoardingHcUi.Button;

    public class AvatarView extends Sprite 
    {

        private static const avatar_halo_png:Class = avatar_halo_png$82950cd231fedfda361bff8687ccabfc571731679;
        private static const avatar_glow_png:Class = avatar_glow_png$d017545e3396bf5304417b2af0cce847518933032;
        private static const placeholder_avatar:Class = placeholder_avatar_png$ab6ef930bb1d4813f1da52ca3f36ad461238453700;

        private var _context:ILoginContext;
        private var _SafeStr_9212:TextField;
        private var _saveButton:ColouredButton;
        private var _cancelButton:ColouredButton;
        private var _SafeStr_3853:Boolean;
        private var _SafeStr_5115:Vector.<AvatarData>;
        private var _SafeStr_9213:int = 10;
        private var _SafeStr_4591:String;
        private var _SafeStr_9214:Sprite;
        private var _avatarDescription:TextField;
        private var _avatarName:TextField;
        private var _SafeStr_9215:int;
        private var _SafeStr_9216:Vector.<DisplayObjectContainer>;
        private var _SafeStr_9217:Bitmap;
        private var _avatarGlow:Bitmap;

        public function AvatarView(_arg_1:ILoginContext)
        {
            _context = _arg_1;
            init();
            addEventListener("addedToStage", onAddedToStage);
        }

        public function set baseUrl(_arg_1:String):void
        {
            _SafeStr_4591 = _arg_1;
        }

        public function dispose():void
        {
            _saveButton.dispose();
            _cancelButton.dispose();
        }

        private function onAddedToStage(_arg_1:Event):void
        {
            var _local_2:Timer = new Timer(20, 1);
            _local_2.addEventListener("timerComplete", onAlignElements);
            _local_2.start();
        }

        private function onAlignElements(_arg_1:TimerEvent):void
        {
            LoaderUI.lineUpVerticallyRevers(_saveButton, 20, _SafeStr_9214);
            LoaderUI.alignAnchors(_SafeStr_9214, 0, "r", _saveButton);
            LoaderUI.lineUpHorizontallyRevers(_saveButton, 20, _cancelButton);
            _SafeStr_14.log(("(avatar) Information panel: " + [_SafeStr_9214.x, _SafeStr_9214.y, _SafeStr_9214.width, _SafeStr_9214.height]));
        }

        public function init():void
        {
            _SafeStr_9215 = 0;
            if (_SafeStr_3853)
            {
                return;
            };
            _SafeStr_3853 = true;
            _SafeStr_9214 = new Sprite();
            addChild(_SafeStr_9214);
            var _local_1:Bitmap = LoaderUI.createBalloon(640, 100, 0, false, 995918, "none");
            _SafeStr_9214.addChild(_local_1);
            _SafeStr_9214.y = 180;
            _avatarDescription = LoaderUI.createTextField("", 18, 8309486, false);
            _avatarName = LoaderUI.createTextField("", 20, 0xFFFFFF, false, true, false, false);
            _avatarName.width = 260;
            _avatarName.x = 50;
            _avatarDescription.x = 50;
            _avatarDescription.width = 260;
            _SafeStr_9214.addChild(_avatarDescription);
            _SafeStr_9214.addChild(_avatarName);
            LoaderUI.lineUpVertically(_local_1, (15 - _local_1.height), _avatarName, 20, _avatarDescription);
            _avatarGlow = new avatar_glow_png();
            _avatarGlow.blendMode = "add";
            _avatarGlow.visible = false;
            _SafeStr_9217 = new avatar_halo_png();
            _SafeStr_9217.blendMode = "overlay";
            _SafeStr_9217.visible = false;
            addTitleField();
            addChild(_SafeStr_9217);
            addChild(_avatarGlow);
            addButtons();
        }

        private function onRemovedFromStage(_arg_1:Event):void
        {
        }

        private function addTitleField():void
        {
            if (!_SafeStr_9212)
            {
                _SafeStr_9212 = LoaderUI.createTextField("${connection.login.account.choose}", 40, 0xFFFFFF, false, true, false, false, "left");
                _SafeStr_9212.x = 0;
                _SafeStr_9212.y = 0;
                _SafeStr_9212.width = 500;
                _SafeStr_9212.multiline = false;
                _SafeStr_9212.thickness = 50;
                addChild(_SafeStr_9212);
            };
        }

        public function addButtons():void
        {
            _cancelButton = new ColouredButton("red", "${generic.cancel}", new Rectangle(0, 300, 0, 40), true, onCancel, 0xD8D8D8);
            addChild(_cancelButton);
            _saveButton = new ColouredButton("gfreen", "${connection.login.play}", new Rectangle(0, 300, 0, 40), true, onChooseAvatar, 0xD8D8D8);
            _saveButton.active = false;
            addChild(_saveButton);
        }

        public function populateAvatars(_arg_1:Vector.<AvatarData>):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_8:* = null;
            var _local_2:int;
            _SafeStr_9216 = new Vector.<DisplayObjectContainer>(0);
            _SafeStr_5115 = _arg_1;
            var _local_6:int;
            for each (var _local_7:AvatarData in _arg_1)
            {
                if (_local_6 > 6) break;
                _SafeStr_14.log(("Adding avatar: " + _local_7.name));
                _local_4 = new Loader();
                _local_4.name = _local_6;
                _local_5 = new URLRequest(getAvatarUrl(_local_7));
                _local_4.load(_local_5);
                _local_4.contentLoaderInfo.addEventListener("complete", avatarImageLoadCompleteHandler);
                _local_4.contentLoaderInfo.addEventListener("error", onImageError);
                _local_4.contentLoaderInfo.addEventListener("ioError", onImageError);
                _local_4.contentLoaderInfo.addEventListener("securityError", onImageError);
                _local_3 = new Sprite();
                _SafeStr_9216.push(_local_3);
                _local_8 = new placeholder_avatar();
                _local_3.addChild(_local_8);
                _local_3.addChild(_local_4);
                addChild(_local_3);
                _local_3.name = _local_6;
                _local_3.addEventListener("click", onAvatarClick);
                _local_2 = (((_local_6 + 1) * _SafeStr_9213) + (_local_6 * 100));
                _local_3.x = _local_2;
                _local_3.y = 50;
                _local_6++;
            };
            if (_arg_1.length > 0)
            {
                updateDescription();
                _SafeStr_9215 = 0;
                _saveButton.active = true;
                _avatarGlow.visible = true;
                _SafeStr_9217.visible = true;
                hilightAvatar(_SafeStr_9216[_SafeStr_9215]);
            }
            else
            {
                _saveButton.active = false;
            };
        }

        private function onImageError(_arg_1:ErrorEvent):void
        {
            _SafeStr_14.log(("Failed to load image " + _arg_1.text));
        }

        private function onAvatarClick(_arg_1:MouseEvent):void
        {
            _SafeStr_9215 = _arg_1.currentTarget.name;
            updateDescription();
            hilightAvatar(_SafeStr_9216[_SafeStr_9215]);
            _saveButton.active = true;
        }

        private function avatarImageLoadCompleteHandler(_arg_1:Event):void
        {
            (_arg_1.currentTarget as LoaderInfo).loader.parent.removeChildAt(0);
            _avatarGlow.visible = true;
            _SafeStr_9217.visible = true;
            hilightAvatar(_SafeStr_9216[_SafeStr_9215]);
        }

        private function updateDescription():void
        {
            if (((_SafeStr_5115 == null) || (_SafeStr_5115.length == 0)))
            {
                return;
            };
            var _local_1:AvatarData = _SafeStr_5115[_SafeStr_9215];
            _avatarName.text = _local_1.name;
            _avatarDescription.text = _local_1.motto;
        }

        private function hilightAvatar(_arg_1:DisplayObject):void
        {
            var _local_2:int = int((_arg_1.x + (_arg_1.width / 2)));
            var _local_3:int = int((_arg_1.y + (_arg_1.height / 2)));
            _avatarGlow.x = (_local_2 - (_avatarGlow.width / 2));
            _avatarGlow.y = ((_local_3 - (_avatarGlow.height / 2)) + 15);
            _SafeStr_9217.x = (_local_2 - (_SafeStr_9217.width / 2));
            _SafeStr_9217.y = ((_local_3 + _SafeStr_9217.height) - 40);
        }

        private function getAvatarUrl(_arg_1:AvatarData):String
        {
            var _local_3:* = null;
            var _local_2:String = ((_SafeStr_4591 + "/habbo-imaging/avatarimage?user=") + _arg_1.name);
            if (((_SafeStr_4591.indexOf("local") > -1) || (_SafeStr_4591.indexOf("127.0.0.1") > -1)))
            {
                _local_3 = "s-0.g-1.d-3.h-3.a-0";
                _local_2 = (("https://www.habbo.com/habbo-imaging/avatarimage?size=m&figure=" + _arg_1.figure) + "&direction=2");
            };
            return (_local_2);
        }

        private function onCancel(_arg_1:Button):void
        {
            _context.showScreen(2);
        }

        private function onChooseAvatar(_arg_1:Button):void
        {
            var _local_2:int = _SafeStr_9215;
            _context.loginWithAvatar(_SafeStr_5115[_local_2]);
        }


    }
}//package login

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3853 = "_-T1w" (String#8500, DoABC#3)
// _SafeStr_4591 = "_-t1s" (String#10265, DoABC#3)
// _SafeStr_5115 = "_-fH" (String#9360, DoABC#3)
// _SafeStr_9212 = "_-wE" (String#10476, DoABC#3)
// _SafeStr_9213 = "_-h1j" (String#9479, DoABC#3)
// _SafeStr_9214 = "_-U1L" (String#8552, DoABC#3)
// _SafeStr_9215 = "_-t12" (String#10240, DoABC#3)
// _SafeStr_9216 = "_-Z1D" (String#8891, DoABC#3)
// _SafeStr_9217 = "_-lD" (String#9768, DoABC#3)


