Tetris = {};

Tetris.MainMenu = function(game){ }; 

Tetris.MainMenu.prototype = { 

    preload : function(){
        //키보드 input handler
        spaceBar = this.game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
    }, 
 
    create : function(){ 
        //배경색지정
        this.game.stage.backgroundColor = '#000000';
        var titleText = this.game.add.text(this.game.world.centerX, this.game.world.height/3, 'TETRIS', { font: '32px Arial', fill: '#fff' });
        //text를 중앙에 셋 0=left, 1=right
        titleText.anchor.set(0.5);

        var subText = this.game.add.text(this.game.world.centerX, titleText.y+130, 'Press SPACE to Play', { font: '32px Arial', fill: '#fff' });
        subText.anchor.set(0.5);    
    }, 
 
    update : function(){
        //space바를 누를경우 게임이 시작하도록 설정
        if(spaceBar.isDown){
            this.game.state.start('Game');
        }
    } 
};
