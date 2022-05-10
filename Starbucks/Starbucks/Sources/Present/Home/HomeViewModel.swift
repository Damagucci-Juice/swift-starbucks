//
//  MainViewModel.swift
//  Starbucks
//
//  Created by seongha shin on 2022/05/09.
//

import Foundation
import RxRelay
import RxSwift

protocol HomeViewModelAction {
    var loadHome: PublishRelay<Void> { get }
    var loadEvent: PublishRelay<Void> { get }
}

protocol HomeViewModelState {
}

protocol HomeViewModelBinding {
    func action() -> HomeViewModelAction
    func state() -> HomeViewModelState
}

typealias HomeViewModelProtocol = HomeViewModelBinding

class HomeViewModel: HomeViewModelBinding, HomeViewModelAction, HomeViewModelState {
    func action() -> HomeViewModelAction { self }
    
    let loadHome = PublishRelay<Void>()
    let loadEvent = PublishRelay<Void>()
    
    func state() -> HomeViewModelState { self }
    
    private var starbucksRepository = StarbucksRepositoryImpl()
    
    private let disposeBag = DisposeBag()
    
    init() {
        
//        let requestHome = action().loadHome
//            .flatMapLatest { [weak self] _ in
//                self?.starbucksRepository.requestHome() ?? .never()
//            }
//            .share()
//            
//        requestHome
//            .compactMap { $0.value }
//            .bind(onNext: {
//                print($0)
//            })
//            .disposed(by: disposeBag)
        
        let requestEvent = action().loadEvent
            .flatMapLatest { [weak self] _ in
                self?.starbucksRepository.requestEvent() ?? .never()
            }
            .share()
        
        requestEvent
            .compactMap { $0.value }
            .bind(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
    }
}
