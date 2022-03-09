import { LightningElement, track } from 'lwc';

export default class QuizApp extends LightningElement {
    selected = {}//for storing answers
    correctAnswer = 0;
    isSubmitted = false;
    myQuestions=[
        {
        id:"Questions1",
        question:"Which of the following is not a template loop ?",
        answers:{
            a:"for:each",
            b:"iterator",
            c:"map loop"
        },
        correctAnswer:"c"
    },
    {
        id:"Questions2",
        question:"Which of the file is invalid in LWC Component folder ?",
        answers:{
            a:".svg",
            b:".apex",
            c:".js"
        },
        correctAnswer:"b"
    },
    {
        id:"Questions3",
        question:"Which of the following is not a directive ?",
        answers:{
            a:"for:each",
            b:"if:true",
            c:"@track"
        },
        correctAnswer:"c"
    }
]
get allNotSelected(){
    return !(Object.keys(this.selected).length === this.myQuestions.length);
}
get isScoredFull(){
    return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswer ? 
        'slds-text-color_success':'slds-text-color_error'}`
}
changeHandler(event){
    console.log("name",event.target.name);
    console.log("value",event.target.value);
    const {name, value} = event.target;
    this.selected = {...this.selected,[name]:value}
}
submitHandler(event){
    event.preventDefault();
    let correct = this.myQuestions.filter(item=>this.selected[item.id]===item.correctAnswer);
    this.correctAnswer = correct.length;
    this.isSubmitted = true;
    console.log("this.correctAnswer ", this.correctAnswer);
}
resetHandler(){
 this.selected={}
 this.correctAnswer = 0;
 this.isSubmitted = false;
}
}